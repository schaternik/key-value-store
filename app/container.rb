# frozen_string_literal: true

# {Container}
class Container
  extend Dry::Container::Mixin

  register :logger, memoize: true do
    device = ENV["RACK_ENV"] == "test" ? nil : STDOUT
    Logger.new(device, progname: "key-store-value")
  end

  register :redis, memoize: true do
    ENV["RACK_ENV"] == "test" ? MockRedis.new : Redis.new(url: ENV["REDIS_URL"])
  end
end
