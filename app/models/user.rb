class User
  include MongoMapper::Document

  key :name, String
  key :uid, String
  key :email, String
  key :paid, Float
  key :remember_token, String
  key :admin, Boolean

  # associations
  many :meals, :foreign_key => :proposer_id
  many :meal_events, :foreign_key => :cook_id
  many :shopping_runs, :foreign_key => :shopper_id

  before_create :create_remember_token

  def liked_meals
      Meal.all.select{ |meal| meal.voters.include?(id) }
  end

  def helped_cook
      MealEvent.all.select { |meal_event| meal_event.helpers.include?(id) }
  end

  def helped_shop
      ShoppingRun.all.select { |shopping_run| shopping_run.helpers.include?(id) }
  end

  def rsvps
      MealEvent.all.select { |meal_event| meal_event.rsvps.include?(id) or meal_event.late_rsvps.include?(id) }
  end

  def attended
      MealEvent.all.select { |meal_event| meal_event.customers.include?(id) }
  end

  def total_charge
      'formula not finalized.'
  end

  private
    def create_remember_token
        self.remember_token = SecureRandom.hex
    end
end
