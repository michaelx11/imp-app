class ShoppingRequestsController < ApplicationController
    def new
        unless signed_in?
            return
        end

        meal_event = MealEvent.find_by_id(params[:meal_event])
        if needs_shopper?(meal_event)
            meal_event.shopping_run = ShoppingRun.find_by_id(params[:shopping_run])
            if verify_shopping_run_event(meal_event.shopping_run)
                log meal_event, 'added'
                meal_event.save
            end
        end
        redirect_to shopping_runs_path
    end

    def edit
        unless signed_in?
            return
        end

        meal_event = MealEvent.find_by_id(params[:meal_event])
        log meal_event, 'removed'
        meal_event.shopping_run = nil
        meal_event.save
        redirect_to shopping_runs_path
    end

    def log(meal_event, action)
        MyLog.log "#{current_user.name} #{action} the meal '#{meal_event.meal.name}' to the shopping run by #{meal_event.shopping_run.shopper.name} on #{meal_event.shopping_run.date}"
    end
end
