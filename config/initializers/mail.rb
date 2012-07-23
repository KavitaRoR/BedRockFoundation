ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :enable_starttls_auto => true,
  :user_name      => "wearefound",
  :password       => "oi890popoi",
  :domain         => 'wearefound.com'
}
ActionMailer::Base.delivery_method = :smtp