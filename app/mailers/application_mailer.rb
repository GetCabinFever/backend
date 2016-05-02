class ApplicationMailer < ActionMailer::Base
  ActionMailer::Base.mail(:from => "noreply@cabin-fever.com", :to => @user.email, :subject => "Cabin Fever email verification", :body => "test").deliver
end
