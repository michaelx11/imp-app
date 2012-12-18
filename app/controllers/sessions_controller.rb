class SessionsController < ApplicationController
    def create
        user = User.find_by_name(params[:session][:name])
        if user
            sign_in user
            puts "SIGNING IN"
            redirect_to root_url
        else
            flash.now[:error] = 'Invalid user'
            render 'new'
        end
    end

    def destroy
        sign_out
        redirect_to root_url
    end
end
