class ShoppingCompletesController < ApplicationController
    def new
        @shopping_complete = ShoppingComplete.new
    end

    def create
        unless signed_in?
            return
        end

        info = params[:shopping_complete]
        @shopping_run = ShoppingRun.find(info[:id])
        @shopping_run.date = Date.strptime(info[:date], "%m/%d/%Y")
        @shopping_run.cost = info[:cost]
        @shopping_run.pending = false
        @shopping_run.save
        redirect_to shopping_runs_path
    end
end
