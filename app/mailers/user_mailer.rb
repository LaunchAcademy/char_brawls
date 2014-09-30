class UserMailer < ActionMailer::Base
  default from: "Charbrawls.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to Charbrawls")
  end
end

