# frozen_string_literal: true

describe "GET /health", type: :request do
  let(:app) do
    Rack::Builder.new.yield_self { |builder| builder.run(Application.freeze.app) }
  end

  before do
    get "/health"
  end

  it "returns OK" do
    expect(last_response.ok?).to eq(true)
    expect(last_response.body).to eq("OK")
  end
end
