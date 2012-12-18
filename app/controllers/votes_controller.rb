class VotesController < ApplicationController
    def edit
        @meal = Meal.find(params[:id])
        if @meal.votes.has_key?(current_user.name)
            @meal.votes.delete(current_user.name)
        else
            @meal.votes[current_user.name] = 1
        end
        @meal.save
        redirect_to meals_path
    end
end
