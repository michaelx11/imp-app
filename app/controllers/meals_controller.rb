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
        @meal = Meal.new(params[:meal])
        @meal.save
        redirect_to meals_path
    end

    def destroy
        @meal = Meal.find(params[:id])
        @meal.destroy
        redirect_to meals_path
    end
end
