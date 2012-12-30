module MealEventsHelper
    def has_shopper?(meal_event)
        !meal_event.shopping_run.nil?
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

    def rsvp_text(meal_event)
        return 'RSVP-ed' if is_rsvp?(meal_event)
        return 'Late RSVP-ed' if is_late_rsvp?(meal_event)
        'RSVP'
    end
end
