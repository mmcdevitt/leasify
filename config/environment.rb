# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Subdomain::Application.initialize!


ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['app23035603@heroku.com'],
  :password       => ENV['koplop'],
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}