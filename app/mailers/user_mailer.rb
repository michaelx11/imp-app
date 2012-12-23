class UserMailer < ActionMailer::Base
  default from: "reminders@mplcr.mit.edu"

  def sample_email(user)
      @user = user
      mail(to: user.email, subject: "Simple sample email")
  end
end
