class MealEvent
  include MongoMapper::Document

  key :meal, String
  key :cook, String
  key :helpers, Set
  key :time, String
  key :rsvps, Set
  key :latersvps, Set
  key :customers, Set

  # name of shopper if a shopping run has been scheduled, otherwise nil
  key :status, String

end
