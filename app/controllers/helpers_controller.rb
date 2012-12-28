class HelpersController < ApplicationController
    def edit
        unless signed_in?
            return
        end

        @meal_event = MealEvent.find(params[:id])
        if is_helper?(@meal_event)
            @meal_event.helpers.delete(current_user.id)
        else
            @meal_event.helpers.add(current_user.id)
        end
        @meal_event.save
        redirect_to meal_events_path
    end
end

