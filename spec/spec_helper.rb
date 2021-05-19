require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require_relative 'setup_test_database'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                 SimpleCov::Formatter::Console
                                                                 # Want a nice code coverage website? Uncomment this next line!
                                                                 # SimpleCov::Formatter::HTMLFormatter
                                                               ])
SimpleCov.start

require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'

Capybara.app = Bookmarks

# For accurate test coverage measurements, require your code AFTER 'SimpleCov.start'

ENV['ENVIRONMENT'] = 'test'

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end
