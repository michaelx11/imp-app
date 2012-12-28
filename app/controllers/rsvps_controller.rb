class RsvpsController < ApplicationController
    def edit
        unless signed_in?
            return
        end

        @meal_event = MealEvent.find(params[:id])
        if is_rsvp?(@meal_event)
            @meal_event.rsvps.delete(current_user.id)
        else
            @meal_event.rsvps.add(current_user.id)
        end
        @meal_event.save
        redirect_to meal_events_path
    end
end


