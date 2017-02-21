require 'user_record_sorter'
require 'user_record'

describe UserRecordSorter do
  let(:record_a) do UserRecord.new({
      last_name: "Adams",
      first_name: "Adam",
      favorite_color: "Almond",
      date_of_birth: Date.parse("2/2/2")
    })
  end
  let(:record_b) do UserRecord.new({
      last_name: "Bridges",
      first_name: "Brian",
      favorite_color: "Brown",
      date_of_birth: Date.parse("12/12/12")
    })
  end
  let(:record_c) do UserRecord.new({
      last_name: "Adams",
      first_name: "Amy",
      favorite_color: "Brown",
      date_of_birth: Date.parse("3/3/3")
    })
  end

  it 'sorts records descending by last name' do
    records = [record_a, record_b]
    sorted_by_last_name = UserRecordSorter.sort_by_last_name_descending(records)

    expect(sorted_by_last_name.first).to eq(record_b)
  end

  it 'sorts records by birth date ascending' do
    records = [record_b, record_a]
    sorted_by_birth_date = UserRecordSorter.sort_by_birth_date(records)

    expect(sorted_by_birth_date.first).to eq(record_a)
  end

  it 'sorts by descending color then last name ascending' do
     records = [record_a, record_b]
     sorted_by_color_and_last_name = UserRecordSorter.sort_by_color_and_last_name(records)

     expect(sorted_by_color_and_last_name.first).to eq(record_b)
  end

  it 'sorts three records by descending color and then last name' do
     records = [record_a, record_b, record_c]
     sorted_by_color_and_last_name = UserRecordSorter.sort_by_color_and_last_name(records)

     expect(sorted_by_color_and_last_name.length).to eq(3)
     expect(sorted_by_color_and_last_name.first).to eq(record_c)
  end
end
