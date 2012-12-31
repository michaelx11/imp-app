class ShoppingRequestsController < ApplicationController
    def new
        unless signed_in?
            return
        end

        meal_event = MealEvent.find_by_id(params[:meal_event])
        unless has_shopper?(meal_event)
            meal_event.shopping_run = ShoppingRun.find_by_id(params[:shopping_run])
            if verify_shopping_run_event(meal_event.shopping_run)
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
        meal_event.shopping_run = nil
        meal_event.save
        redirect_to shopping_runs_path
    end
end
