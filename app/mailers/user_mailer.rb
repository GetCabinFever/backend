class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    ActionMailer::Base.mail(:from => "me@example.com", :to => "you@example.com", :subject => "Cabin Fever email verification", :body => "test").deliver
  end
end
