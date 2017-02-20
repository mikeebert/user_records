require 'rack/test'
require 'csv'
require 'spec_helper'
require './records_api'

def app
  Records::API
end

describe Records::API do
  include Rack::Test::Methods

  before(:all) do
    Datastore.set_location('./spec/support/record_datastore.txt')
  end

  after(:each) do
    clear_datastore
  end

  context 'POST records' do

    context 'no data posted' do
      it 'returns a 400 if no data is sent' do
        post '/records'

        expect(last_response.status).to eq(400)
      end
    end

    it 'saves a record do to the datastore' do
      data = "ApiTestLast, TestFirst, TestColor, 01/01/01"
      post '/records', data, 'CONTENT_TYPE' => 'application/txt'

      expect(Datastore.records.first.last_name).to eq('ApiTestLast')
    end
  end

  context 'GET records' do
    context 'birthdate' do
      it 'has a records/birthdate endpoint' do
        get '/records/birthdate'

        expect(last_response.status).to eq(200)
      end
    end
  end

  private

  def create_record(data)
    Datastore.save(RecordCreator.new(data).record)
  end
end
