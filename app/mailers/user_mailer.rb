class UserMailer < ApplicationMailer
  default from: 'no-reply-CabinFever@example.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Verification')
  end
end
