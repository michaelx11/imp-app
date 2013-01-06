class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper
  include SessionsHelper
  include MealsHelper
  include MealEventsHelper
  include ShoppingRunsHelper
  include UserTogglesHelper
end
