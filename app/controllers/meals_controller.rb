class MealsController < ApplicationController
    def index
        @meals = Meal.all
    end

    def show
        @meal = Meal.find(params[:id])
    end

    def new
        @meal = Meal.new
    end

    def create
        unless signed_in?
            return
        end

        @meal = Meal.new(params[:meal])
        @meal.proposer = current_user
        @meal.save
        log @meal, 'created'
        redirect_to meals_path
    end

    def destroy
        unless signed_in?
            return
        end

        @meal = Meal.find(params[:id])
        log @meal, 'deleted'
        @meal.destroy
        redirect_to meals_path
    end

    def log(meal, action)
        MyLog.log "#{current_user.name} #{action} the meal '#{meal.name}'"
    end
end
