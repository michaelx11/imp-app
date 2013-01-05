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

  # flag if this meal is a side dish (relatively small)
  key :side_dish, Boolean

  # materials needed for the meal (for the shopper's knowledge)
  key :need_materials, Boolean
  key :materials, String

  # maximum number of RSVPs allowed = rsvps + late rsvps
  key :limit_rsvps, Boolean
  key :max_rsvps, Integer

  # reminders
  key :remind_in_advance, Integer
  key :reminded, Boolean

  validates :date, :presence => true
  validates :time, :presence => true
  validates :description, :length => {:maximum => 500}
  validates :materials, :length => {:maximum => 500}
  validates :max_rsvps, :inclusion => 1..50

  def start_time
      return date.to_datetime
  end
end
