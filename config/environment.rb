# Load the rails application
require File.expand_path('../application', __FILE__)

# default the environment to produciton for railsplayground
ENV['RAILS_ENV'] ||= 'production'

# Initialize the rails application
Mildwurm::Application.initialize!
