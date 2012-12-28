class LateRsvpsController < ApplicationController
    def edit
        unless signed_in?
            return
        end

        @meal_event = MealEvent.find(params[:id])
        if is_late_rsvp?(@meal_event)
            @meal_event.late_rsvps.delete(current_user.id)
        else
            @meal_event.late_rsvps.add(current_user.id)
        end
        @meal_event.save
        redirect_to meal_events_path
    end
end


