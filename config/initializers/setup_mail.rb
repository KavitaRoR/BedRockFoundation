# ActionMailer::Base.smtp_settings = {
#   :address              => "smtp.gmail.com",
#   :port                 => 587,
#   :user_name            => "khopkins218@gmail.com",
#   :password             => "Tallywacker",
#   :authentication       => "plain",
#   :enable_starttls_auto => true
# }

ActionMailer::Base.default_url_options[:host] = 'app.bedrockfoundations.com' 
# Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
