ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.gmail.com',
  :port           => '587',
  :authentication => :ssl,
  :user_name      => "apps@wearefound.com",
  :password       => "asdqwe123qwe",
  :domain         => 'google.com'
}
ActionMailer::Base.delivery_method = :smtp