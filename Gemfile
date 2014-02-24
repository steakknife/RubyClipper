source 'https://rubygems.org'

ruby '2.1.0'

gem 'rails', '4.0.2'

# app server
gem 'puma'

# database
gem 'pg'

# views
gem 'simple_form'

# html
gem 'haml-rails'

# css
gem 'sass-rails', '~> 4.0.0'

# js
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'coffee-rails', '~> 4.0.0'

# web frameworks
gem 'foundation-rails', '5.0.3.1'
#gem 'foundation_rails_helper' # replaces form_for

# assets
gem 'font-awesome-rails'

# auth
gem 'omniauth'
gem 'omniauth-github' # https://github.com/settings/applications
gem 'omniauth-bitbucket' # https://bitbucket.org/account/user/{{username}}/api
gem 'omniauth-google-oauth2' # https://cloud.google.com/console
gem 'omniauth-twitter' # https://apps.twitter.com/app
gem 'omniauth-facebook' # https://developer.facebook.com

# controller 
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'

# misc
gem 'figaro' # env var config via config/application.yml 
gem 'high_voltage' # static pages app/views/pages

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', platforms: [:mri_19, :mri_20, :mri_21, :rbx]
  gem 'html2haml', require: nil
  gem 'hub', require: nil
  gem 'quiet_assets'
  gem 'rails_layout'
end

group :development, :test do
  gem 'pry-rails'

  gem 'rspec', require: nil
  gem 'rspec-rails', '~> 3.0.0.beta', require: nil
  gem 'rspec-collection_matchers', require: nil
  gem 'respec', require: nil
end
