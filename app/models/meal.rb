class Meal
  include MongoMapper::Document

  key :name, String
  belongs_to :proposer, :class_name => 'User', :foreign_key => 'proposed_meals_id'
  key :voters, Set # User.ids
  key :cooked, Boolean

  validates :name, :presence => true, :length => {:maximum => 50 }

end
