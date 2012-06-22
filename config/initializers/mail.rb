ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.gmail.com',
  :port           => '587',
  :authentication => :login,
  :enable_starttls_auto => true,
  :user_name      => "apps@wearefound.com",
  :password       => "asdqwe123qwe",
  :domain         => 'wearefound.com'
}
ActionMailer::Base.delivery_method = :smtp