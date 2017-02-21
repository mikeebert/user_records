require 'spec_helper'

require 'datastore'
require 'date'
require 'user_record'

describe Datastore do
  let(:user_record) {
    UserRecord.new({
      first_name: "TestFirst",
      last_name: "TestLast",
      favorite_color: "TestColor",
      date_of_birth: Date.strptime('01/17/2001', '%m/%d/%Y')
    })
  }

  before(:all) do
    Datastore.set_location('./spec/support/record_datastore.txt')
  end

  after(:each) do
    clear_datastore
  end

  it 'saves a record' do
    Datastore.save(user_record)

    expect(Datastore.records.first.first_name).to eq(user_record.first_name)
  end

  it 'saves the date in a proper format' do
    Datastore.save(user_record)
    datafile = File.open('./spec/support/record_datastore.txt')

    expect(datafile.read).to include('01/17/2001')
  end
end
