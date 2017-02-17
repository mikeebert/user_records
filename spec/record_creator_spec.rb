require 'record_creator'

describe RecordCreator do

  context 'invalid data' do
    it 'is invalid if no data is passed in' do
      creator = RecordCreator.new('')

      expect(creator.valid?).to eq(false)
    end
  end

  context 'valid data' do
    it 'is valid if all fields are passed in' do
      creator = RecordCreator.new("LastName, FirstName, FavoriteColor, 01/01/01")

      expect(creator.valid?).to eq(true)
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
