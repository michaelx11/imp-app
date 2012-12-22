class ShoppingRun
  include MongoMapper::Document

  key :shopper, String # User.id
  key :time, Date # TODO change to Date
  key :requests, Set # TODO contains MealEvent.id's
  key :cost, Float

  # 'Done' if completed, otherwise 'Pending'
  key :status, String

  validates :shopper, :presence => true
  validates :time, :presence => true

end
