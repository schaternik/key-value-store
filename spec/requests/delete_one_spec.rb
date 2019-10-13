# frozen_string_literal: true

describe "DELETE /keys/:key", type: :request do
  let(:app) do
    Rack::Builder.new.yield_self { |builder| builder.run(Application.freeze.app) }
  end

  let(:response) do
    "1"
  end

  before do
    Container[:redis].set("key1", "value1")
    Container[:redis].set("key2", "value2")

    delete "/keys/key1"
  end

  it "returns number of deleted records" do
    expect(last_response.ok?).to eq(true)
    expect(last_response.body).to eq(response)
  end

  context "when there is no key" do
    let(:response) do
      "0"
    end

    before do
      delete "/keys/key1"
    end

    it "returns number of deleted records" do
      expect(last_response.ok?).to eq(true)
      expect(last_response.body).to eq(response)
    end
  end
end
