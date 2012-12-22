class MealEventStatusesController < ApplicationController
    def edit
        unless signed_in?
            return
        end

        @meal_event = MealEvent.find(params[:id])
        if is_pending?(@meal_event)
            @meal_event.status = current_user.name
            @meal_event.save
            redirect_to shopping_runs_path
        end
    end
end
