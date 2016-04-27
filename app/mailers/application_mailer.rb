class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@cabinfever.herokuapp.com"
  layout 'mailer'
end
