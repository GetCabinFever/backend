class ApplicationMailer < ActionMailer::Base
  ActionMailer::Base.mail(:from => "noreply@cabin-fever.com", :to => "you@example.com", :subject => "Cabin Fever email verification", :body => "test").deliver
end
