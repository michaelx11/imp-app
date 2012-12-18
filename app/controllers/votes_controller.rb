class VotesController < ApplicationController
    def edit
        @meal = Meal.find(params[:id])
        if @meal.votes.has_key?("user")
            @meal.votes.delete("user")
        else
            @meal.votes["user"] = 1
        end
        @meal.save
        redirect_to meals_path
    end
end
