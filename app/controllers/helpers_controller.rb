class HelpersController < ApplicationController
    def edit
        @meal_event = MealEvent.find(params[:id])
        if @meal_event.helpers.include?(current_user.name)
            @meal_event.helpers.delete(current_user.name)
        else
            @meal_event.helpers.add(current_user.name)
        end
        @meal_event.save
        redirect_to meal_events_path
    end
end

