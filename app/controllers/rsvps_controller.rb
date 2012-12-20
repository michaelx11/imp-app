class RsvpsController < ApplicationController
    def edit
        @meal_event = MealEvent.find(params[:id])
        if @meal_event.rsvps.include?(current_user.name)
            @meal_event.rsvps.delete(current_user.name)
        else
            @meal_event.rsvps.add(current_user.name)
        end
        @meal_event.save
        redirect_to meal_events_path
    end
end


