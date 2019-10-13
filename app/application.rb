# frozen_string_literal: true

# {Application}
class Application < ::Roda
  route do |r|
    r.get "health" do
      ["ok"].to_json
    end
  end
end
