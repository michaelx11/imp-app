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
      mail(to: user.email, subject: "Reminder: Upcoming meal event")
  end

  def send_meal_event_emails()
      MealEvent.all.each do |meal_event|
          unless meal_event.reminded
              if meal_event.time - Time.now <= meal_event.remind_in_advance * 60
                  puts "Sending meal event mail"
                  UserMailer.meal_event_email(User.find(meal_event.cook), Meal.find(meal_event.meal), meal_event.date, meal_event.time).deliver
                  meal_event.update_attributes({reminded: true})
              end
          end
      end
  end

  def shopping_run_email(user, date)
      @user = user
      @date = date
      mail(to: user.email, subject: "Reminder: Upcoming shopping run")
  end
  
  def send_shopping_run_emails()
      ShoppingRun.all.each do |shopping_run|
          unless shopping_run.reminded
              if shopping_run.date - Date.today <= shopping_run.remind_in_advance
                  puts "Sending shopping run mail"
                  UserMailer.shopping_run_email(User.find(shopping_run.shopper), shopping_run.date).deliver
                  shopping_run.update_attributes({reminded: true})
              end
          end
      end
  end

  def need_people_email(users, meal_dates, shopping_runs)
      @meal_dates = meal_dates
      @shopping_runs = shopping_runs
      mail(to: users.map(&:email), subject: "Important: Need additional people")
  end

  def send_need_people_emails()
      meal_dates = Set.new
      shopping_runs = Set.new
      Date.today.upto(Date.today + 3) do |date|
          t = Time.new(date.year, date.month, date.day, 0, 0, 0, 0)
          if MealEvent.where(:date => t).empty?
              meal_dates.add(date)
          end
          MealEvent.where({:date => t, :status => nil}).each do |meal_event|
              shopping_runs.add(meal_event)
          end
      end
      UserMailer.need_people_email(User.find_each, meal_dates, shopping_runs).deliver
  end
end
