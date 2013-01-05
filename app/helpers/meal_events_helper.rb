module MealEventsHelper
    def needs_shopper?(meal_event)
        meal_event.need_materials and meal_event.shopping_run.nil?
    end

    def is_helper?(meal_event)
        meal_event.helpers.include?(current_user.id)
    end

    def help_text(meal_event)
        return 'Won\'t Help' if is_helper?(meal_event)
        'Help Cook'
    end

    def is_rsvp?(meal_event)
        meal_event.rsvps.include?(current_user.id)
    end

    def is_late_rsvp?(meal_event)
        meal_event.late_rsvps.include?(current_user.id)
    end

    def is_some_rsvp?(meal_event)
        is_rsvp?(meal_event) || is_late_rsvp?(meal_event)
    end

    def rsvp_full?(meal_event)
        meal_event.rsvps.size + meal_event.late_rsvps.size >= meal_event.max_rsvps
    end

    def rsvp_text(meal_event)
        return 'RSVP-ed' if is_rsvp?(meal_event)
        return 'Late RSVP-ed' if is_late_rsvp?(meal_event)
        'RSVP'
    end


    def future_meal_event(meal_event)
        meal_event.date >= Date.today
    end

    def collided_meal_event(meal_event)
        MealEvent.each do |meal_event_other|
            if meal_event != meal_event_other and meal_event.date == meal_event_other.date
                return true
            end
        end
        false
    end

    def far_future_meal_event(meal_event)
        meal_event.date >= Date.today + 14 # more than 2 weeks away
    end

    def verify_meal_event(meal_event)
        if is_admin?
            return true
        end
        unless future_meal_event(meal_event)
            flash[:error] = 'Error: meal must be scheduled in the future.'
            return false
        end
        if collided_meal_event(meal_event)
            flash[:alert] = 'WARNING: there is already a meal scheduled at that time.'
        end
        if far_future_meal_event(meal_event)
            flash[:alert] = 'WARNING: meal was scheduled in the far future.'
        end
        flash[:notice] = "#{ meal_event.meal.name } successfully scheduled."
        true
    end
end
