class ShoppingRun
  include MongoMapper::Document

  key :shopper, String
  key :time, String
  key :requests, Set
  key :cost, Float

  # 'done' if completed, otherwise nil
  key :status, String

  validates :shopper, :presence => true
  validates :time, :presence => true

end
