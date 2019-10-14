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

  it "returns keys and their values" do
    expect(last_response.ok?).to eq(true)
    expect(last_response.body).to eq(response.to_json)
  end

  context "when filter passed" do
    let(:response) do
      {
        "word" => "value"
      }
    end

    before do
      Container[:redis].set("key1", "value1")
      Container[:redis].set("key2", "value2")
      Container[:redis].set("word", "value")
      Container[:redis].set("word2", "wordvalue2")

      get "/keys?filter=wo?d"
    end

    it "returns keys matched to filter and their values" do
      expect(last_response.ok?).to eq(true)
      expect(last_response.body).to eq(response.to_json)
    end
  end
end
