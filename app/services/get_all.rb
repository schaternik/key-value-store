# frozen_string_literal: true

# {GetAll}
class GetAll
  def call
    keys = Container[:redis].keys

    keys.each_with_object({}) do |item, hash|
      hash[item] = Container[:redis].get(item)
    end
  end
end
