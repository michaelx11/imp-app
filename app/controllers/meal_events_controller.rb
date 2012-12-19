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
        @meal_event = MealEvent.new(params[:meal_event])
        if @meal_event.cook.blank?
            @meal_event.cook = current_user.name
        end
        @meal_event.save
        redirect_to meal_events_path
    end

    def destroy
        @meal_event = MealEvent.find(params[:id])
        @meal_event.destroy
        redirect_to meal_events_path
    end
end
