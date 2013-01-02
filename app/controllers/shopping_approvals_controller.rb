class ShoppingApprovalsController < ApplicationController
    def new
        unless is_admin?
            return
        end

        shopping_run = ShoppingRun.find_by_id(params[:shopping_run])
        shopping_run.update_attributes(:approved => true)
        log shopping_run
        redirect_to shopping_runs_path
    end

    def log(shopping_run)
        MyLog.log "#{current_user.name} approved the shopping run by #{shopping_run.shopper.name} on #{shopping_run.date}"
    end
end


