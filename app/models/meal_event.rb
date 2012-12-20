class MealEvent
  include MongoMapper::Document

  key :meal, String
  key :cook, String
  key :helpers, Set
  key :time, String
  key :rsvps, Set
  key :latersvps, Set
  key :customers, Set

end
