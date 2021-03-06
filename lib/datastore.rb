require 'csv'
require 'user_record_creator'

class Datastore

  def self.set_location(filepath)
    @data_location ||= filepath
  end

  def self.save(record)
    f = File.open(@data_location, 'a')
    f.puts(self.convert(record))
    f.close
  end

  def self.records
    File.read(@data_location).lines.map do |record|
      UserRecordCreator.new(record).record
    end
  end

  def self.reset!
    @records = nil
  end

  private

  def self.convert(record)
    "#{record.last_name}," +
    "#{record.first_name}," +
    "#{record.favorite_color}," +
    "#{record.date_of_birth.strftime('%d/%m/%Y')}"
  end
end
