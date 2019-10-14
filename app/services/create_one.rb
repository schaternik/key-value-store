# frozen_string_literal: true

# {CreateOne}
class CreateOne
  def call(params:)
    key = params["key"]
    value = params["value"]
    exp_sec = params["expire_in"]
    opts = exp_sec ? { ex: exp_sec } : {}

    Container[:redis].set(key, value, opts)
  end
end
