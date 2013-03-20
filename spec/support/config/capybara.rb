RSpec.configure do |config|
  # we know jquery, we should use jquery
  Capybara.default_selector = :css
end