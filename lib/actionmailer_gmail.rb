ActionMailer::Base.smtp_settings = {
	:address => "smtp.gmail.com",
	:port => 587,
	:authentication => :plain,
	:domain => ENV['stadiumexpress.heroku.com'],
	:user_name => ENV['admin@stadiumexpress.com'],
	:password => ENV['stadium1express'],
}
