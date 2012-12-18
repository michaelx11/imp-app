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
        @meal.votes = 0
        @meal.save
        redirect_to meals_path
    end

    def destroy
        @meal = Meal.find(params[:id])
        @meal.destroy
        redirect_to meals_path
    end

    # Increments the number of votes.
    def edit
        @meal = Meal.find(params[:id])
        @meal.update_attribute :votes, @meal.votes + 1
        redirect_to meals_path
    end
end
