class UserTogglesController < ApplicationController
    def new
        user_toggle
        redirect_to :root
    end
end
