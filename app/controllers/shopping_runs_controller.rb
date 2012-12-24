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
        unless signed_in?
            return
        end

        @shopping_run = ShoppingRun.new(params[:shopping_run])
        @shopping_run.date = Date.strpdate(params[:shopping_run][:date], "%m/%d/%Y")
        if @shopping_run.shopper.blank?
            @shopping_run.shopper = current_user.name
        end
        @shopping_run.status = 'Pending'
        @shopping_run.save
        redirect_to shopping_runs_path
    end

    def destroy
        unless signed_in?
            return
        end

        @shopping_run = ShoppingRun.find(params[:id])
        @shopping_run.destroy
        redirect_to shopping_runs_path
    end

    def edit
        @shopping_run = ShoppingRun.find(params[:id])
    end

    def update
        unless signed_in?
            return
        end

        @shopping_run = ShoppingRun.find(params[:id])
        @shopping_run.status = 'Done'
        @shopping_run.cost = params[:shopping_run][:cost]
        @shopping_run.save
        redirect_to shopping_runs_path
    end
end
