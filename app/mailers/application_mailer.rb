class ApplicationMailer < ActionMailer::Base
  ActionMailer::Base.mail(:from => "me@example.com", :to => "you@example.com", :subject => "Cabin Fever email verification", :body => "test").deliver
end
