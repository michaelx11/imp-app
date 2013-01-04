class ShoppingHelpersController < ApplicationController
    def edit
        unless signed_in?
            return
        end

        @shopping_run = ShoppingRun.find(params[:id])
        if is_shopping_helper?(@shopping_run)
            log 'un-help'
            @shopping_run.helpers.delete(current_user.id)
        else
            log 'help'
            @shopping_run.helpers.add(current_user.id)
        end
        @shopping_run.save
        redirect_to shopping_runs_path
    end

    def log(help)
        helping = (help == 'help')
        MyLog.log "#{current_user.name} is #{'not ' unless helping}helping shop on '#{@shopping_run.date}' with #{@shopping_run.shopper.name}"
    end
end

