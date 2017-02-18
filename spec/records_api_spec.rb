require 'rack/test'
require './records_api'

def app
  Records::API
end

describe Records::API do
  include Rack::Test::Methods

  it 'posts to a records endpoint' do
    post '/records'

    expect(last_response.status).to eq(201)
  end
end

