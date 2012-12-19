class Authorization
  include MongoMapper::Document

  belongs_to :user
  validates_presence_of :user_id, :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  key :provider, String
  key :uid, String
  key :user_id, Integer

  
end
