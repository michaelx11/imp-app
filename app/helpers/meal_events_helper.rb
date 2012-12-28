module MealEventsHelper
    def has_shopper?(meal_event)
        !meal_event.shopping_run.nil?
    end

    def meal_event_status_text(meal_event)
        return (meal_event.shopping_run.shopper.name + ' shopping') if has_shopper?(meal_event)
        'awaiting shopper'
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

    def rsvp_text(meal_event)
        return 'Un-RSVP' if is_rsvp?(meal_event)
        'RSVP'
    end

    def is_late_rsvp?(meal_event)
        meal_event.late_rsvps.include?(current_user.id)
    end

    def late_rsvp_text(meal_event)
        return 'Un-RSVP Late' if is_late_rsvp?(meal_event)
        'RSVP Late'
    end
end
