class Meal
  include MongoMapper::Document

  key :name, String
  belongs_to :proposer, :class_name => 'User'
  key :voters, Set # User.ids
  one :meal_event

  validates :name, :presence => true, :length => {:maximum => 50 }

end
