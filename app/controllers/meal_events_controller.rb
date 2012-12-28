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
        @meal_event.meal = Meal.find_by_id(info[:meal])
        @meal_event.cook = User.find_by_id(info[:cook])
        @meal_event.shopping_run = ShoppingRun.find_by_id(info[:shopping_run])
        @meal_event.date = Date.strptime(info[:date], "%m/%d/%Y")
        @meal_event.time = info[:time]
        @meal_event.reminded = info[:remind_in_advance].blank?
        @meal_event.save
        redirect_to meal_events_path
    end

    def destroy
        unless signed_in?
            return
        end

        @meal_event = MealEvent.find(params[:id])
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
        @meal_event.date = Date.strptime(info[:date], "%m/%d/%Y")
        @meal_event.time = info[:time]
        @meal_event.reminded = info[:remind_in_advance].blank?
        @meal_event.save
        redirect_to meal_events_path
    end
end
