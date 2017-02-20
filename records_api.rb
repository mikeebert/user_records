require 'grape'
require 'record_creator'
require 'record_sorter'

module Records
  class API < Grape::API
    content_type :txt, 'application/txt'
    content_type :json, 'application/json'

    format :json

    resource :records do
      desc 'add a record to the datastore'

      post '/' do
        record_creator = RecordCreator.new(extract_data(request))

        if record_creator.valid?
          ::Datastore.save(record_creator.record)
        else
          status 400
        end
      end

      get '/birthdate' do
        records = ::RecordSorter.sort_by_birth_date(Datastore.records)

        present records
      end

      get '/name' do

      end
    end

    helpers do
      def extract_data(request)
        request.env["api.request.input"] || ''
      end
    end
  end
end
