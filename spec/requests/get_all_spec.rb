# frozen_string_literal: true

describe "GET /keys", type: :request do
  let(:app) do
    Rack::Builder.new.yield_self { |builder| builder.run(Application.freeze.app) }
  end

  let(:response) do
    {
      "key1" => "value1",
      "key2" => "value2"
    }
  end

  before do
    Container[:redis].set("key1", "value1")
    Container[:redis].set("key2", "value2")

    get "/keys"
  end

  it "returns keys and values" do
    expect(last_response.ok?).to eq(true)
    expect(last_response.body).to eq(response.to_json)
  end
end
