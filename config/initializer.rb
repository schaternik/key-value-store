# frozen_string_literal: true

ENV.fetch("RACK_ENV", "development").then { |app_env| Bundler.require(:default, app_env) }

require "dotenv/load"

Zeitwerk::Loader.new.tap do |loader|
  loader.push_dir("app")
  loader.setup
end
