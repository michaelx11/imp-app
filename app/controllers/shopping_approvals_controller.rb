class ShoppingApprovalsController < ApplicationController
    def new
        unless is_admin?
            return
        end

        shopping_run = ShoppingRun.find_by_id(params[:shopping_run])
        shopping_run.update_attributes(:approved => true)
        redirect_to shopping_runs_path
    end
end


