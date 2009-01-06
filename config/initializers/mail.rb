# E-mail server configurations
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "localhost",
  :port => 25,
  :domain => "localhost",
  # :authentication => :login,
  # :user_name => "mail@yourapplication.com",
  # :password => "yourapplicationpassword"  
}
