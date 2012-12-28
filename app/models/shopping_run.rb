class ShoppingRun
  include MongoMapper::Document

  belongs_to :shopper, :class_name => 'User'
  key :date, Date
  key :cost, Float
  key :pending, Boolean

  # reminders
  key :remind_in_advance, Integer
  key :reminded, Boolean

  validates :shopper, :presence => true
  validates :date, :presence => true

end
