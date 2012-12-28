class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include MealsHelper
  include MealEventsHelper
  include ShoppingRunsHelper
end
