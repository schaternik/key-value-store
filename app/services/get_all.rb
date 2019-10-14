# frozen_string_literal: true

# {GetAll}
class GetAll
  def call(params:)
    filter = params["filter"] || "*"
    # :TODO: `keys` can be changed to more performant `scan_each` and variations
    keys = Container[:redis].keys(filter)

    keys.each_with_object({}) do |item, hash|
      hash[item] = Container[:redis].get(item)
    end
  end
end
