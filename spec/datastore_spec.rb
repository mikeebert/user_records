require 'datastore'
require 'user_record'
require 'date'
require 'spec_helper'

describe Datastore do
  let(:user_record) {
    UserRecord.new({
      first_name: "TestFirst",
      last_name: "TestLast",
      favorite_color: "TestColor",
      date_of_birth: Date.parse("01/01/01")
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
end
