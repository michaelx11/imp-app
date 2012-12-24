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
        d = @meal_event.date
        t = Time.parse(params[:meal_event][:time])
        @meal_event.time = Time.new(d.year, d.month, d.day, t.hour, t.min, t.sec)
        Meal.update(@meal_event.meal, :cooked => true)
        if @meal_event.cook.blank?
            @meal_event.cook = current_user.name
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
        d = @meal_event.date
        t = Time.parse(params[:meal_event][:time])
        @meal_event.time = Time.new(d.year, d.month, d.day, t.hour, t.min, t.sec)
        @meal_event.save
        redirect_to meal_events_path
    end
end
