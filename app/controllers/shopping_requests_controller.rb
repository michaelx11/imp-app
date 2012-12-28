class ShoppingRequestsController < ApplicationController
    def new
        @shopping_request = ShoppingRequest.new
        @meal_event = params[:meal_event]
    end

    def create
        unless signed_in?
            return
        end

        info = params[:shopping_request]
        meal_event = MealEvent.find_by_id(info[:meal_event])
        unless has_shopper?(meal_event)
            meal_event.shopping_run = ShoppingRun.find_by_id(info[:shopping_run])
            meal_event.save
        end
        redirect_to shopping_runs_path
    end
end
