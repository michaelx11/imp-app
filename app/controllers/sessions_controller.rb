class SessionsController < ApplicationController
    def new
        redirect_to '/auth/Facebook'
    end

    def create
        auth = request.env['omniauth.auth']
        user = User.find_by_uid(auth.uid)
        
        if user
            sign_in user
            puts "SIGNING IN"
        else
            flash.now[:error] = 'Invalid user'
        end
        redirect_to root_url
    end

    def destroy
        sign_out
        redirect_to root_url
    end
end
