# frozen_string_literal: true

# {DeleteOne}
class DeleteOne
  def call(key:)
    Container[:redis].del(key).to_s
  end
end
