class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def sample_email(user)
      @user = user
      mail(to: user.email, subject: "Simple sample email")
  end
end
