class ShoppingRequestsController < ApplicationController
    def new
        @shopping_request = ShoppingRequest.new
        @meal_event = params[:meal_event]
    end

    def create
        unless signed_in?
            return
        end

        shopping_request = params[:shopping_request]
        meal_event = shopping_request[:meal_event]
        puts "MEAL EVENT ", meal_event
        if is_pending?(MealEvent.find_by_id(meal_event))
            MealEvent.update(meal_event, :status => current_user.name)
            @shopping_run = ShoppingRun.find_by_id(shopping_request[:shopping_run])
            @shopping_run.requests << meal_event
            @shopping_run.save
        end
        redirect_to shopping_runs_path
    end
end
