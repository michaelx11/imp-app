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

        info = params[:shopping_run]
        @shopping_run = ShoppingRun.new
        @shopping_run.shopper = User.find_by_id(info[:shopper])
        @shopping_run.date = Date.strptime(info[:date], "%m/%d/%Y")
        @shopping_run.reminded = info[:remind_in_advance]
        @shopping_run.pending = true
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

        info = params[:shopping_run]
        @shopping_run = ShoppingRun.find(params[:id])
        @shopping_run.shopper = User.find_by_id(info[:shopper])
        @shopping_run.date = Date.strptime(info[:date], "%m/%d/%Y")
        @shopping_run.reminded = info[:remind_in_advance]
        @shopping_run.save
        redirect_to shopping_runs_path
    end
end
