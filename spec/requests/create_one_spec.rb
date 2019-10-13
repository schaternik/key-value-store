# frozen_string_literal: true

describe "PUT /keys", type: :request do
  let(:app) do
    Rack::Builder.new.yield_self { |builder| builder.run(Application.freeze.app) }
  end

  let(:request_body) do
    { "random_key" => "random_value" }
  end

  before do
    put "/keys", request_body
  end

  it "returns OK and status OK" do
    expect(last_response.ok?).to eq(true)
    expect(last_response.body).to eq("OK")
  end
end
