class RsvpsController < ApplicationController
    def edit
        unless signed_in?
            return
        end

        @meal_event = MealEvent.find(params[:id])
        if is_rsvp?(@meal_event)
            log 'un-rsvp'
            @meal_event.rsvps.delete(current_user.id)
        elsif is_late_rsvp?(@meal_event)
            log 'un-rsvp', 'late'
            @meal_event.late_rsvps.delete(current_user.id)
        else
            if params['late'].blank?
                log 'rsvp'
                @meal_event.rsvps.add(current_user.id)
            else
                log 'rsvp', 'late'
                @meal_event.late_rsvps.add(current_user.id)
            end
        end
        @meal_event.save
        redirect_to meal_events_path
    end

    def log(rsvp, late = nil)
        rsvping = (rsvp == 'rsvp')
        MyLog.log "#{current_user.name} #{'un-' unless rsvping}#{'late-' if late}rsvped #{rsvping ? 'to' : 'from'} '#{@meal_event.meal.name}'"
    end
end


