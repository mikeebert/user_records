require 'rack/test'
require 'csv'
require 'spec_helper'
require './records_api'
require 'datastore'

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

    it 'saves a record to the datastore' do
      data = "ApiTestLast, TestFirst, TestColor, 01/01/01"
      post '/records', data, 'CONTENT_TYPE' => 'application/txt'

      expect(last_response.status).to eq(201)
      expect(Datastore.records.first.last_name).to eq('ApiTestLast')
    end
  end

  context 'GET records/birthdate' do
    it 'has a records/birthdate endpoint' do
      get '/records/birthdate'

      expect(last_response.status).to eq(200)
    end

    it 'retrives records sorted by birthdate' do
      create_record('BornLater, Bobby, Blue, 02/01/01')
      create_record('BornEarlier, Adam, Azul, 01/01/01')

      get '/records/birthdate'
      records = JSON.parse(last_response.body)

      expect(records.first['last_name']).to eq('BornEarlier')
    end
  end

  context 'GET records/name' do
    it 'has a records/name endpoint' do
      get '/records/name'

      expect(last_response.status).to eq(200)
    end

    it 'retrives records by last name in reverse order' do
      create_record('Brown, Bobby, Blue, 02/01/01')
      create_record('Adams, Adam, Azul, 01/01/01')

      get '/records/name'
      records = JSON.parse(last_response.body)

      expect(records.first['last_name']).to eq('Brown')
    end
  end

  private

  def create_record(data)
    Datastore.save(RecordCreator.new(data).record)
  end
end
