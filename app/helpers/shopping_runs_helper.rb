module ShoppingRunsHelper
    def shopping_run_status_text(shopping_run)
        return 'Pending' if shopping_run.pending
        return 'Approved' if shopping_run.approved
        'Completed'
    end

    def shopping_run_requests(shopping_run)
        requests = []
        MealEvent.each do |meal_event|
            if meal_event.shopping_run == shopping_run
                requests << meal_event
            end
        end
        requests
    end

    def future_shopping_run(shopping_run)
        shopping_run.date >= Date.today
    end

    def collided_shopping_run_event(shopping_run)
        ShoppingRun.each do |shopping_run_other|
            if shopping_run != shopping_run_other and shopping_run.date == shopping_run_other.date
                return true
            end
        end
        false
    end

    def far_future_shopping_run(shopping_run)
        shopping_run.date >= Date.today + 14 # more than 2 weeks away
    end

    def valid_shopping_run(shopping_run)
        # Test that all meal events are after this shopping run.
        shopping_run.meal_events.each do |meal_event|
            if meal_event.date < shopping_run.date
                return false
            end
        end
        true
    end

    def verify_shopping_run_event(shopping_run)
        if is_admin?
            return true
        end
        unless future_shopping_run(shopping_run)
            flash[:error] = 'Error: shopping run must be scheduled in the future.'
            return false
        end
        unless valid_shopping_run(shopping_run)
            flash[:error] = 'A meal is scheduled before the date of this shopping run.'
            return false
        end
        if collided_shopping_run_event(shopping_run)
            flash[:alert] = 'WARNING: there is already a shopping run scheduled at that time.'
        elsif far_future_shopping_run(shopping_run)
            flash[:alert] = 'WARNING: shopping run was scheduled in the far future.'
        else
            flash[:notice] = "Shopping run on #{ shopping_run.date } successfully scheduled."
        end
        true
    end
end
