class User
  include MongoMapper::Document

 # has_many :authorizations

  key :name, String
  key :paid, Float
  key :remember_token, String

  before_save :create_remember_token

  def self.create_from_hash!(hash)
      create(:name => hash['user_info']['name'])
  end

  private
    def create_remember_token
        self.remember_token = SecureRandom.hex
    end
end
