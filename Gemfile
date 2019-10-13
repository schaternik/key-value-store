# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

ruby "~> 2.6.5"

gem "dry-container"
gem "puma"
gem "redis"
gem "roda"
gem "zeitwerk"

group :development, :test do
  gem "dotenv"
  gem "pry"
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rspec", require: false
end

group :test do
  gem "rack-test"
  gem "rspec"
  gem "simplecov"
end
