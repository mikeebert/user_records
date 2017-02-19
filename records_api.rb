require 'grape'

module Records
  class API < Grape::API

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
    end

    helpers do
      def extract_data(request)
        request.env["api.request.input"] || ''
      end
    end
  end
end
