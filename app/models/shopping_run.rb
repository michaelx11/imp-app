class ShoppingRun
  include MongoMapper::Document

  belongs_to :shopper, :class_name => 'User'
  key :date, Date
  key :cost, Float
  key :pending, Boolean
  key :approved, Boolean

  # associations
  many :meal_events

  # reminders
  key :remind_in_advance, Integer
  key :reminded, Boolean

  validates :date, :presence => true

end
