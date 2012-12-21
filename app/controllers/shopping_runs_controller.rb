class ShoppingRunsController < ApplicationController
    def index
        @shopping_runs = ShoppingRun.all
    end

    def show
        @shopping_run = ShoppingRun.find(params[:id])
    end

    def new
        @shopping_run = ShoppingRun.new
    end

    def create
        @shopping_run = ShoppingRun.new(params[:shopping_run])
        if @shopping_run.shopper.blank?
            @shopping_run.shopper = current_user.name
        end
        @shopping_run.save
        redirect_to shopping_runs_path
    end

    def destroy
        @shopping_run = ShoppingRun.find(params[:id])
        @shopping_run.destroy
        redirect_to shopping_runs_path
    end

    def edit
        @shopping_run = ShoppingRun.find(params[:id])
    end

    def update
        @shopping_run = ShoppingRun.find(params[:id])
        @shopping_run.status = 'done'
        @shopping_run.cost = params[:shopping_run][:cost]
        @shopping_run.save
        redirect_to shopping_runs_path
    end
end