require 'user_record'
require 'date'

describe UserRecord do
  it 'has a last name' do
    record = UserRecord.new({last_name: "Last"})
    expect(record.last_name).to eq("Last")
  end

  it 'has a first name' do
    record = UserRecord.new({first_name: 'First'})
    expect(record.first_name).to eq('First')
  end

  it 'has a favorite color' do
    record = UserRecord.new({favorite_color: 'Blue'})
    expect(record.favorite_color).to eq('Blue')
  end

  it 'has a date of birth' do
    date_of_birth = Date.strptime('01/01/2012','%m/%d/%Y')
    record = UserRecord.new({date_of_birth: date_of_birth})
    expect(record.date_of_birth).to eq(date_of_birth)
  end

  it 'returns the attrubutes as a hash' do
    attributes = {
      first_name: 'Roger',
      last_name: 'Rabbit',
      date_of_birth: Date.parse('01/01/01'),
      favorite_color: 'yellow'
    }
    record = UserRecord.new(attributes)

    expect(record.attributes).to eq(attributes)
  end
end
