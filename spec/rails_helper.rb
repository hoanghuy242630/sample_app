require "shoulda/matchers"
require "spec_helper"
require File.expand_path "../../config/environment", __FILE__
require "rspec/rails"

ENV["RAILS_ENV"] ||= "test"
abort "The Rails environment is running in production mode!" if Rails.env.production?
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
