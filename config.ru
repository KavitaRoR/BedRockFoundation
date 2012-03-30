# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Abundant::Application

Abundant::Application.config.middleware.use ExceptionNotifier,
  :email_prefix => "[ABF] ",
  :sender_address => %{"notifier" <app@bedrockfoundations.com>},
  :exception_recipients => %w{support@wearefound.com}