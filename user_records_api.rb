require 'grape'
require 'user_record_creator'
require 'user_record_sorter'

module UserRecords
  class API < Grape::API
    content_type :txt, 'application/txt'
    content_type :json, 'application/json'

    format :json

    resource :records do
      desc 'add a record to the datastore'

      post '/' do
        record_creator = UserRecordCreator.new(extract_data(request))

        if record_creator.valid?
          ::Datastore.save(record_creator.record)
        else
          status 400
        end
      end

      get '/birthdate' do
        records = ::UserRecordSorter.sort_by_birth_date(Datastore.records)

        present records
      end

      get '/name' do
        records = ::UserRecordSorter.sort_by_last_name_descending(Datastore.records)

        present records
      end
    end

    helpers do
      def extract_data(request)
        request.env["api.request.input"] || ''
      end
    end
  end
end
