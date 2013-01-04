class MealEventsController < ApplicationController
    def index
        @meal_events = MealEvent.all
    end

    def show
        @meal_event = MealEvent.find(params[:id])
    end

    def new
        @meal_event = MealEvent.new
    end

    def create
        unless signed_in?
            return
        end

        info = params[:meal_event]
        @meal_event = MealEvent.new

        # If 'new_meal' is set, create a new meal. Otherwise, associate with the corresponding meal.
        if info['new_meal']
            @meal_event.meal = Meal.new(:name => info[:meal], :proposer => current_user)
        else
            @meal_event.meal = Meal.find_by_id(info[:meal])
        end

        @meal_event.cook = User.find_by_id(info[:cook])
        @meal_event.date = Date.strptime(info[:date], "%m/%d/%Y")
        @meal_event.time = info[:time]
        @meal_event.description = info[:description]
        @meal_event.materials = info[:materials]
        @meal_event.max_rsvps = info[:max_rsvps].blank? ? 50 : info[:max_rsvps]
        @meal_event.remind_in_advance = info[:remind_in_advance]
        @meal_event.reminded = info[:remind_in_advance].blank?
        if verify_meal_event(@meal_event)
            log @meal_event, 'created'
            @meal_event.save
            redirect_to meal_events_path
        else
            redirect_to meals_path
        end
    end

    def destroy
        unless signed_in?
            return
        end

        @meal_event = MealEvent.find(params[:id])
        log @meal_event, 'deleted'
        @meal_event.destroy
        redirect_to meal_events_path
    end

    def edit
        @meal_event = MealEvent.find(params[:id])
    end

    def update
        unless signed_in?
            return
        end

        @meal_event = MealEvent.find(params[:id])
        info = params[:meal_event]
        @meal_event.meal = Meal.find_by_id(info[:meal])
        @meal_event.cook = User.find_by_id(info[:cook])
        @meal_event.date = Date.strptime(info[:date], "%m/%d/%Y")
        @meal_event.time = info[:time]
        @meal_event.remind_in_advance = info[:remind_in_advance]
        @meal_event.reminded = info[:remind_in_advance].blank?
        @meal_event.max_rsvps = info[:max_rsvps].blank? ? 50 : info[:max_rsvps]
        @meal_event.description = info[:description]
        @meal_event.materials = info[:materials]
        unless info[:customers].nil?
            @meal_event.customers = info[:customers].select{ |customer| !customer.blank?}.to_set
        end
        if verify_meal_event(@meal_event)
            log @meal_event, 'edited'
            unless info[:customers].nil?
                log @meal_event, 'submitted customers to', true
            end
            @meal_event.save
        end
        redirect_to meal_events_path
    end

    def log(meal_event, action, select_customers = false)
        MyLog.log "#{current_user.name} #{action} the meal event '#{meal_event.meal.name}' on #{meal_event.date} at #{meal_event.time} cooked by #{meal_event.cook.name} #{'for ' + meal_event.max_rsvps.to_s unless meal_event.max_rsvps == 50}#{': ' + show_users(meal_event.customers) if select_customers}"
    end
end
