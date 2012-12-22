class LateRsvpsController < ApplicationController
    def edit
        unless signed_in?
            return
        end

        @meal_event = MealEvent.find(params[:id])
        if is_late_rsvp?(@meal_event)
            @meal_event.latersvps.delete(current_user.name)
        else
            @meal_event.latersvps.add(current_user.name)
        end
        @meal_event.save
        redirect_to meal_events_path
    end
end


