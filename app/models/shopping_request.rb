class ShoppingRequest
  include MongoMapper::Document

  key :shopping_run, ShoppingRun
  key :meal_event, String # MealEvent.id
end
