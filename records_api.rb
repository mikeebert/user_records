require 'grape'

module Records
  class API < Grape::API

    resource :records do
      desc 'add a record to the datastore'

      post '/' do

      end
    end
  end
end
