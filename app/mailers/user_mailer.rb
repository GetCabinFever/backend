class UserMailer < ApplicationMailer
  default from: 'no-reply-CabinFever@example.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Verification')
  end

  def new_listing_email(user)
  	@user = user
    mail(to: @user.email, subject: 'Your new listing')
  end

  def comment_email(user)
  	@user = user
  	mail(to: @user.email, subject: 'Someone Signed Your Guest Book!')
  end
end
