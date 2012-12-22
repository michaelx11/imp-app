class User
  include MongoMapper::Document

  key :name, String
  key :uid, String
  key :email, String
  key :paid, Float
  key :remember_token, String

  before_save :create_remember_token

  private
    def create_remember_token
        self.remember_token = SecureRandom.hex
    end
end
