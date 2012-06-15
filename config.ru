# This file is used by Rack-based servers to start the application.
require 'newrelic_rpm'
require 'new_relic/rack/developer_mode'
use NewRelic::Rack::DeveloperMode


require ::File.expand_path('../config/environment',  __FILE__)
run Abundant::Application

Abundant::Application.config.middleware.use ExceptionNotifier,
  :email_prefix => "[ABF] ",
  :sender_address => %{"notifier" <app@bedrockfoundations.com>},
  :exception_recipients => %w{support@wearefound.com}