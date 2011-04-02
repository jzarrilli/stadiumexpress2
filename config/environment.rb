# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Depot::Application.initialize!

#Rails::Initializer.run do |config|
# 
 # config.middleware.use “NoWWW” if RAILS_ENV == ‘production’
# 


Depot::Application.configure do config.action_mailer.delivery_method = :smtp
 # config.action_mailer.delivery_method = :smtp
  
  ActionMailer::Base.smtp_settings = {
  	:address => "smtp.gmail.com",
  	:port => 587,
  	:authentication => :plain,
  	#:enable_starttls_auto => true,
  	:domain => "stadiumexpress.heroku.com",
  	:user_name => "osibodu@gmail.com",
  	:password => "Cesc4Fab",
  }
  config.action_mailer.raise_delivery_errors=true
end
  
 # config.action_mailer.smtp_settings = {
#    :address => @order.email,
 #   :port => 587,
 #   :domain => "stadiumexpress.heroku.com",
 #   :authentication => "plain",
  #  :user_name => "osibodu@gmail.com",
  #  :password => "Cesc4Fab",
  #  :enable_starttls_auto => true
#  }

#end
