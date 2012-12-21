module MealEventsHelper
    def is_helper?(meal_event)
        meal_event.helpers.include?(current_user.name)
    end

    def help_text(meal_event)
        return 'Won\'t Help' if is_helper?(meal_event)
        'Help Cook'
    end

    def is_rsvp?(meal_event)
        meal_event.rsvps.include?(current_user.name)
    end

    def rsvp_text(meal_event)
        return 'Un-RSVP' if is_rsvp?(meal_event)
        'RSVP'
    end

    def is_late_rsvp?(meal_event)
        meal_event.latersvps.include?(current_user.name)
    end

    def late_rsvp_text(meal_event)
        return 'Un-RSVP Late' if is_late_rsvp?(meal_event)
        'RSVP Late'
    end
end
