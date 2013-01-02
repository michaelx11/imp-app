class VotesController < ApplicationController
    def edit
        unless signed_in?
            return
        end

        @meal = Meal.find(params[:id])
        if contains_vote?(@meal)
            log @meal, 'downvoted'
            @meal.voters.delete(current_user.id)
        else
            log @meal, 'upvoted'
            @meal.voters << current_user.id
        end
        @meal.save
        redirect_to meals_path
    end

    def log(meal, action)
        MyLog.log "#{current_user.name} #{action} the meal '#{meal.name}'"
    end
end
