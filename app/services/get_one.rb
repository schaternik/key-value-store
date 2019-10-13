# frozen_string_literal: true

# {GetOne}
class GetOne
  def call(key:)
    Container[:redis].get(key)
  end
end
