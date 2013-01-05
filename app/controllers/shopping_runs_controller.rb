class ShoppingRunsController < ApplicationController
    def index
        @shopping_runs = ShoppingRun.all
    end

    def show
        @shopping_run = ShoppingRun.find(params[:id])
    end

    def new
        @shopping_run = ShoppingRun.new
    end

    def create
        unless signed_in?
            return
        end

        info = params[:shopping_run]
        @shopping_run = ShoppingRun.new
        @shopping_run.shopper = User.find_by_id(info[:shopper])
        @shopping_run.date = Date.strptime(info[:date], "%m/%d/%Y")
        @shopping_run.place = info[:place]
        @shopping_run.remind_in_advance = info[:remind_in_advance] unless info[:reminded] == 'true'
        @shopping_run.reminded = info[:reminded] == 'true'
        @shopping_run.pending = true
        @shopping_run.approved = false
        meal_event = MealEvent.find_by_id(info['request'])
        unless meal_event.nil?
            meal_event.shopping_run = @shopping_run
        end
        if verify_shopping_run_event(@shopping_run)
            unless meal_event.nil?
                meal_event.save
            end
            log @shopping_run, 'created'
            @shopping_run.save
        end
        redirect_to shopping_runs_path
    end

    def destroy
        unless signed_in?
            return
        end

        @shopping_run = ShoppingRun.find(params[:id])
        log @shopping_run, 'deleted'
        @shopping_run.destroy
        redirect_to shopping_runs_path
    end

    def edit
        @shopping_run = ShoppingRun.find(params[:id])
    end

    def update
        unless signed_in?
            return
        end

        info = params[:shopping_run]
        @shopping_run = ShoppingRun.find(params[:id])
        @shopping_run.shopper = User.find_by_id(info[:shopper])
        @shopping_run.date = Date.strptime(info[:date], "%m/%d/%Y")
        @shopping_run.place = info[:place]
        if info[:remind_in_advance]
            @shopping_run.remind_in_advance = info[:remind_in_advance] unless info[:reminded] == 'true'
            @shopping_run.reminded = info[:reminded] == 'true'
        elsif info[:cost]
            @shopping_run.cost = info[:cost]
        end
        if verify_shopping_run_event(@shopping_run)
            log @shopping_run, 'edited'
            @shopping_run.save
        end
        redirect_to shopping_runs_path
    end

    def log(shopping_run, action)
        MyLog.log "#{current_user.name} #{action} the shopping run by #{shopping_run.shopper.name} on #{shopping_run.date} at #{shopping_run.place}"
    end
end
