class Meal
  include MongoMapper::Document

  key :name, String
  key :votes, Hash

  validates :name, :presence => true, :length => {:maximum => 50 }

end
