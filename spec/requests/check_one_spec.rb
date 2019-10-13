# frozen_string_literal: true

describe "HEAD /keys/:key", type: :request do
  let(:app) do
    Rack::Builder.new.yield_self { |builder| builder.run(Application.freeze.app) }
  end

  before do
    Container[:redis].set("key1", "value1")

    head "/keys/key1"
  end

  it "returns empty body and status OK" do
    expect(last_response.ok?).to eq(true)
    expect(last_response.body).to be_empty
  end

  context "when there is no such key" do
    before do
      head "/keys/key2"
    end

    it "returns empty body and status OK" do
      expect(last_response.not_found?).to eq(true)
      expect(last_response.body).to be_empty
    end
  end
end
