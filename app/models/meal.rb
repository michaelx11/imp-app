class Meal
  include MongoMapper::Document

  key :name, String
  key :proposer, String
  key :votes, Hash

  validates :name, :presence => true, :length => {:maximum => 50 }
  validates :proposer, :presence => true

end
