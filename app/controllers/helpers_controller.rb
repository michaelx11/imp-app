class HelpersController < ApplicationController
    def edit
        @meal_event = MealEvent.find(params[:id])
        return '' unless can_help?(@meal_event)

        if is_helper?(@meal_event)
            log 'un-help'
            @meal_event.helpers.delete(current_user.id)
        else
            log 'help'
            @meal_event.helpers.add(current_user.id)
        end
        @meal_event.save
        redirect_to meal_events_path
    end

    def log(help)
        helping = (help == 'help')
        MyLog.log "#{current_user.name} is #{'not ' unless helping}helping cook '#{@meal_event.meal.name}'"
    end
end

