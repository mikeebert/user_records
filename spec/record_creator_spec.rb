require 'record_creator'

describe RecordCreator do

  context 'valid data' do
    it 'parses a comma separated data record' do
      creator = RecordCreator.new("LastName, FirstName, FavoriteColor, 01/01/01")
      data = creator.parse_data

      expect(data.length).to eq(4)
    end

    it 'parses a pipe delimited data record' do
      creator = RecordCreator.new("LastName | FirstName | FavoriteColor | 01/01/01")
      data = creator.parse_data

      expect(data.length).to eq(4)
    end

    it 'strips white space from pipe-delimited data records' do
      creator = RecordCreator.new("LastName | FirstName | FavoriteColor | 01/01/01")
      data = creator.parse_data

      expect(data.first).to eq("LastName")
    end

    it 'strips white space from comma separated data records' do
      creator = RecordCreator.new("LastName , FirstName , FavoriteColor , 01/01/01")
      data = creator.parse_data

      expect(data.first).to eq("LastName")
    end
  end
end
