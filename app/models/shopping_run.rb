class ShoppingRun
  include MongoMapper::Document

  key :shopper, String
  key :time, String
  key :requests, Set
  key :cost, Float

  # 'Done' if completed, otherwise 'Pending'
  key :status, String

  validates :shopper, :presence => true
  validates :time, :presence => true

end
