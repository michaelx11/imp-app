class User
  include MongoMapper::Document

  key :name, String
  key :uid, String
  key :email, String
  key :paid, Float
  key :remember_token, String

  # associations
  many :meals, :foreign_key => :proposer_id
  many :meal_events, :foreign_key => :cook_id
  many :shopping_runs, :foreign_key => :shopper_id

  before_create :create_remember_token

  private
    def create_remember_token
        self.remember_token = SecureRandom.hex
    end
end
