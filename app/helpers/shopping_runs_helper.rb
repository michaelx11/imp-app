module ShoppingRunsHelper
    def shopping_run_status_text(shopping_run)
        return 'Pending' if shopping_run.pending
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
end
