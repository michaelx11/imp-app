class VotesController < ApplicationController
    def edit
        unless signed_in?
            return
        end

        @meal = Meal.find(params[:id])
        if @meal.votes.include?(current_user.name)
            @meal.votes.delete(current_user.name)
        else
            @meal.votes.add(current_user.name)
        end
        @meal.save
        redirect_to meals_path
    end
end
