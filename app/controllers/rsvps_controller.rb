class RsvpsController < ApplicationController
    def edit
        @meal_event = MealEvent.find(params[:id])
        if is_rsvp?(@meal_event)
            @meal_event.rsvps.delete(current_user.name)
        else
            @meal_event.rsvps.add(current_user.name)
        end
        @meal_event.save
        redirect_to meal_events_path
    end
end


