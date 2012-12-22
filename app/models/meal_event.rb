class MealEvent
  include MongoMapper::Document

  key :meal, String # Meal.id
  key :cook, String # User.id
  key :helpers, Set # contains User.name's TODO change to User.id's
  key :time, Date # TODO change to Date
  key :rsvps, Set # contains User.name's TODO change to User.id's
  key :latersvps, Set # contains User.name's TODO change to User.id's
  key :customers, Set # contains User.name's TODO change to User.id's

  # name of shopper if a shopping run has been scheduled, otherwise nil
  # TODO change to id of shopper if a shopping run has been scheduled
  key :status, String

end
