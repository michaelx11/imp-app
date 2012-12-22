class Meal
  include MongoMapper::Document

  key :name, String
  key :proposer, String # User.name TODO change to User.id
  key :votes, Set # contains User.name's TODO change to User.id's

  validates :name, :presence => true, :length => {:maximum => 50 }
  validates :proposer, :presence => true

end
