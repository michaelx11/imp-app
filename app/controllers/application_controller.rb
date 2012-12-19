class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  def index
      unless signed_in?
          redirect_to '/auth/facebook'
      end
  end
end
