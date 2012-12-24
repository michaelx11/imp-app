class Reminder
  include MongoMapper::Document

  key :user, String,
  key :time, Time,
  key :in_advance, Float

end
