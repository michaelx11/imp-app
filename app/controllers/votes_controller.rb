class VotesController < ApplicationController
    def edit
        unless signed_in?
            return
        end

        @meal = Meal.find(params[:id])
        if contains_vote?(@meal)
            @meal.voters.delete(current_user.id)
        else
            @meal.voters << current_user.id
        end
        @meal.save
        redirect_to meals_path
    end
end
