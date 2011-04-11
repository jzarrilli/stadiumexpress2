ActionMailer::Base.smtp_settings = {
	:address => "smtp.gmail.com",
	:port => 587,
	:authentication => :plain,
	:domain => ENV['stadiumexpress.heroku.com'],
	:user_name => ENV['stadiumexp@gmail.com'],
	:password => ENV['stadium10'],
}
