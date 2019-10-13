# frozen_string_literal: true

# {DeleteAll}
class DeleteAll
  def call
    keys = Container[:redis].keys
    Container[:redis].del(*keys).to_s
  end
end
