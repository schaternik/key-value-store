# frozen_string_literal: true

# {DeleteAll}
class DeleteAll
  def call
    keys = Container[:redis].keys
    return "0" if keys.empty?

    Container[:redis].del(*keys).to_s
  end
end
