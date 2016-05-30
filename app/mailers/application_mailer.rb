class ApplicationMailer < ActionMailer::Base
  default from: ENV["RAILS_EMAIL"]
  layout 'mailer'
end
