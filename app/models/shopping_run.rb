class ShoppingRun
  include MongoMapper::Document

  key :shopper, String
  key :time, String
  key :requests, Set
  key :cost, Float

  validates :shopper, :presence => true
  validates :time, :presence => true

end
