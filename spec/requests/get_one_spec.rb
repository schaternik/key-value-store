# frozen_string_literal: true

describe "GET /keys/:key", type: :request do
  let(:app) do
    Rack::Builder.new.yield_self { |builder| builder.run(Application.freeze.app) }
  end

  let(:response) do
    "value2"
  end

  before do
    Container[:redis].set("key1", "value1")
    Container[:redis].set("key2", "value2")

    get "/keys/key2"
  end

  it "returns key's value" do
    expect(last_response.ok?).to eq(true)
    expect(last_response.body).to eq(response)
  end

  context "when there is no key" do
    before do
      get "/keys/random"
    end

    it "returns nothing" do
      expect(last_response.not_found?).to eq(true)
      expect(last_response.body).to be_empty
    end
  end
end
