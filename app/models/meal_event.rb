class MealEvent
  include MongoMapper::Document

  belongs_to :meal
  belongs_to :cook, :class_name => 'User'
  belongs_to :shopping_run
  key :helpers, Set # User.ids
  key :date, Date
  key :time, Time
  key :rsvps, Set # User.ids
  key :late_rsvps, Set # User.ids
  key :customers, Set # User.ids

  # description of meal (for customers' knowledge)
  key :description, String

  # materials needed for the meal (for the shopper's knowledge)
  key :materials, String

  # reminders
  key :remind_in_advance, Integer
  key :reminded, Boolean


end
