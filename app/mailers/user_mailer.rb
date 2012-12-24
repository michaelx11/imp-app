class UserMailer < ActionMailer::Base
  default from: "reminders@mplcr.mit.edu"

  def sample_email(user)
      @user = user
      mail(to: user.email, subject: "Simple sample email")
  end

  def meal_event_email(user, meal, date, time)
      @user = user
      @meal = meal
      @date = date
      @time = time
      mail(to: user.email, subject: "Reminder: Meal Event")
  end

  def send_meal_event_mails()
      MealEvent.all.each do |meal_event|
          unless meal_event.reminded
              if meal_event.time - Time.now <= meal_event.remind_in_advance * 60
                  puts "Sending mail"
                  UserMailer.meal_event_email(User.find(meal_event.cook), Meal.find(meal_event.meal), meal_event.date, meal_event.time).deliver
                  meal_event.update_attributes({reminded: true})
              end
          end
      end
  end
end
