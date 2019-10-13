# frozen_string_literal: true

# {CreateOne}
class CreateOne
  def call(params:)
    key = params["key"]
    value = params["value"]

    Container[:redis].set(key, value)
  end
end
