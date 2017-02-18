require 'record_creator'
require 'user_record'

describe RecordCreator do

  context 'invalid data' do
    it 'is invalid if no data is passed in' do
      creator = RecordCreator.new('')

      expect(creator.valid?).to eq(false)
    end

    it 'is invalid if less than 4 fields are present' do
      creator = RecordCreator.new("Last, First, Color")

      expect(creator.valid?).to eq(false)
    end

    it 'is invalid if more than 4 fields are present' do
      creator = RecordCreator.new("Last, First, Color, DOB, ExtraField")

      expect(creator.valid?).to eq(false)
    end

    it 'is invalid if a non-standard separator is passed in' do
      creator = RecordCreator.new("Last ; First ; Color ; DOB ; ExtraField")

      expect(creator.valid?).to eq(false)
    end
  end

  context 'date validation' do
    it 'is invalid if an improper date is passed in' do
      creator = RecordCreator.new("Last, First, Favorite, 2/31/2017")

      expect(creator.valid?).to eq(false)
    end

    it 'is valid if a proper date is passed in' do
      creator = RecordCreator.new("Last, First, Favorite, 2/1/2017")

      expect(creator.valid?).to eq(true)
    end
  end

  context 'valid data' do
    it 'is valid if all fields are passed in' do
      creator = RecordCreator.new("LastName, FirstName, FavoriteColor, 01/01/01")

      expect(creator.valid?).to eq(true)
    end

  end

  context 'returning a valid record' do
    it 'builds a record with valid data' do
      date_of_birth = "01/01/01"
      creator = RecordCreator.new("Last, First, Color, #{date_of_birth}")
      user_record = creator.record

      expect(user_record.first_name).to eq("First")
      expect(user_record.last_name).to eq("Last")
      expect(user_record.favorite_color).to eq("Color")
      expect(user_record.date_of_birth).to eq(Date.parse(date_of_birth))
    end
  end

  context 'parsing data' do
    it 'parses a comma separated data record' do
      creator = RecordCreator.new("LastName, FirstName, FavoriteColor, 01/01/01")

      expect(creator.fields.length).to eq(4)
    end

    it 'parses a pipe delimited data record' do
      creator = RecordCreator.new("LastName | FirstName | FavoriteColor | 01/01/01")

      expect(creator.fields.length).to eq(4)
    end

    it 'strips white space from pipe-delimited data records' do
      creator = RecordCreator.new("LastName | FirstName | FavoriteColor | 01/01/01")

      expect(creator.fields.first).to eq("LastName")
    end

    it 'strips white space from comma separated data records' do
      creator = RecordCreator.new("LastName , FirstName , FavoriteColor , 01/01/01")

      expect(creator.fields.first).to eq("LastName")
    end
  end
end
