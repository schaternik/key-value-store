# frozen_string_literal: true

ENV["RACK_ENV"] = "test"

require "simplecov"

SimpleCov.start do
  coverage_dir "tmp/coverage"

  add_filter ".bundle"
  add_filter "config"
  add_filter "spec"

  minimum_coverage 100
end

require_relative "../config/initializer"

require "rack/test"

RSpec.configure do |config|
  config.include Rack::Test::Methods, type: :request

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
