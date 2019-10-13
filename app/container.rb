# frozen_string_literal: true

# {Container}
class Container
  extend Dry::Container::Mixin

  register :logger, memoize: true do
    Logger.new(STDOUT, progname: "key-store-value")
  end
end
