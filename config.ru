# This file is used by Rack-based servers to start the application.

$stdout.sync = $stderr.sync = true # consistent logging on Heroku

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application
