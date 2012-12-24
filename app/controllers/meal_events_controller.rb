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

        @meal_event = MealEvent.new(params[:meal_event])
        @meal_event.date = Date.strptime(params[:meal_event][:date], "%m/%d/%Y")
        @meal_event.time = Time.new(@meal_event.date.year, @meal_event.date.month, @meal_event.date.day, @meal_event.time.hour, @meal_event.time.min, @meal_event.time.sec)
        Meal.update(@meal_event.meal, :cooked => true)
        if @meal_event.cook.blank?
            @meal_event.cook = current_user.name
        end
        if @meal_event.remind_in_advance.blank?
            @meal_event.reminded = true
        else
            @meal_event.reminded = false
        end
        @meal_event.save
        redirect_to meal_events_path
    end

    def destroy
        unless signed_in?
            return
        end

        @meal_event = MealEvent.find(params[:id])
        Meal.update(@meal_event.meal, :cooked => false)
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
        @meal_event.update_attributes(params[:meal_event])
        @meal_event.date = Date.strptime(params[:meal_event][:date], "%m/%d/%Y")
        @meal_event.time = Time.new(@meal_event.date.year, @meal_event.date.month, @meal_event.date.day, @meal_event.time.hour, @meal_event.time.min, @meal_event.time.sec)
        if @meal_event.remind_in_advance.blank?
            @meal_event.reminded = true
        else
            @meal_event.reminded = false
        end
        @meal_event.save
        redirect_to meal_events_path
    end
end
