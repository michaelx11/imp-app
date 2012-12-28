class ShoppingRequest
  include MongoMapper::Document

  key :shopping_run, String # ShoppingRun.id
  key :meal_event, String # MealEvent.id
end
