module MealsHelper
    def contains_vote?(meal)
        meal.voters.include?(current_user.id)
    end

    def vote_text(meal)
        return '-1' if contains_vote?(meal)
        '+1'
    end
end
