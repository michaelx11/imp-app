class ShoppingRun
  include MongoMapper::Document

  key :shopper, String # User.id
  key :date, Date # TODO change to Date
  key :requests, Set # TODO contains MealEvent.id's
  key :cost, Float

  # 'Done' if completed, otherwise 'Pending'
  key :status, String

  # reminders
  key :remind_in_advance, Integer
  key :reminded, Boolean

  validates :shopper, :presence => true
  validates :date, :presence => true

end
