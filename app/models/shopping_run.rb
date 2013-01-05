class ShoppingRun
  include MongoMapper::Document

  belongs_to :shopper, :class_name => 'User'
  key :date, Date
  key :place, String
  key :helpers, Set # User.ids
  key :cost, Float
  key :pending, Boolean
  key :approved, Boolean

  # associations
  many :meal_events

  # reminders
  key :remind_in_advance, Integer
  key :reminded, Boolean

  validates :date, :presence => true
  validates :place, :presence => true

  def start_time
      return date.to_datetime
  end
end
