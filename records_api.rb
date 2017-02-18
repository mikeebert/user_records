require 'grape'
require 'datastore'

module Records
  class API < Grape::API

    resource :records do
      desc 'add a record to the datastore'

      post '/' do
        record_creator = RecordCreator.new(request.body.string)

        if record_creator.valid?
          ::Datastore.save(record_creator.record)
        else
          status 400
        end
      end
    end

  end
end
