class MealEvent
  include MongoMapper::Document

  key :meal, String
  key :cook, String
  key :helpers, Array
  key :time, String
  key :rsvps, Array
  key :latersvps, Array
  key :customers, Array

end
