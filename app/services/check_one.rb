# frozen_string_literal: true

# {CheckOne}
class CheckOne
  def call(key:)
    Container[:redis].exists(key)
  end
end
