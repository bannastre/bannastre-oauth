ENV['RACK_ENV'] = 'test'

require 'capybara/rspec'
require 'data_mapper'
require 'database_cleaner'

require './spec/helpers/users_helper'
require './app/app'

Capybara.app = App

RSpec.configure do |config|

  config.include UsersHelper

  config.before(:suite) do
    DataMapper.auto_migrate!
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:transaction)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
