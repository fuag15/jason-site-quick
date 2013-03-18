source 'https://rubygems.org'

gem 'rails', '3.2.12' # hardset rails version

gem 'pg', '~> 0.14.1' # postgres gem for db backend
gem 'jquery-rails', '~> 2.2.1' # jquery in asset pipe
gem 'haml-rails', '~> 0.4' # haml interpretation
gem 'unicorn', '~> 4.6.2' # alternative quick C based webserver
gem 'carrierwave', '~> 0.8.0' # image and file uploading
gem 'rmagick', '~> 2.13.2' # image manipulation library
gem 'devise', '~> 2.2.3' # user management
gem 'cancan', '~> 1.6.9' # route access control

group :assets do
  gem 'bootstrap-sass', '~> 2.3.0.1' # twitter bootstrap
  gem 'sass-rails',   '~> 3.2.3' # sass interpretation
  gem 'coffee-rails', '~> 3.2.1' # coffee asset pipe support
  gem 'therubyracer', '~> 0.11.4', :platforms => :ruby # javascript runtime in ruby
  gem 'uglifier', '>= 1.0.3' # asset minification
end

group :test, :development do
  gem 'cheat', '~> 1.3.3' # quick spec lookup
  gem 'debugger', '~> 1.5.0' # ruby debugg generalist tool
  gem 'pry', '~> 0.9.12' # ruby runtime introspection
  gem 'rspec-rails', '~> 2.13.0' # unit tests for models / routes
  gem 'factory_girl_rails', '~> 4.2.1' # model factories
  gem 'capybara', '~> 2.0.2' # headless browser tests
  gem 'launchy', '~> 2.2.0' # auto launch web page for capybara tests
end
