# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

every 30.minutes do
    runner "UserMailer.send_meal_event_emails", environment: "development"
    runner "UserMailer.send_shopping_run_emails", environment: "development"
end

every 1.day do
    runner "UserMailer.send_need_people_emails", environment: "development"
end
