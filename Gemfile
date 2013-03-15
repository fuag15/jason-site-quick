source 'https://rubygems.org'

gem 'rails', '3.2.12' # hardset rails version

gem 'pg' # postgres gem for db backend
gem 'jquery-rails' # jquery in asset pipe
gem 'haml-rails' # haml interpretation
gem 'unicorn' # alternative quick C based webserver
gem 'carrierwave' # image and file uploading
gem 'rmagick' # image manipulation library
gem 'devise' # user management
gem 'cancan' # route access control

group :assets do
  gem 'bootstrap-sass', '~> 2.3.0.1' # twitter bootstrap
  gem 'sass-rails',   '~> 3.2.3' # sass interpretation
  gem 'coffee-rails', '~> 3.2.1' # coffee asset pipe support
  gem 'therubyracer', :platforms => :ruby # javascript runtime in ruby
  gem 'uglifier', '>= 1.0.3' # asset minification
end

group :test, :development do
  gem 'cheat' # quick spec lookup
  gem 'debugger' # ruby debugg generalist tool
  gem 'pry' # ruby runtime introspection
  gem 'rspec-rails' # unit tests for models / routes
  gem 'factory_girl_rails' # model factories
end
