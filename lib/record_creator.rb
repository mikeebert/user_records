require 'user_record'

class RecordCreator

  LAST_NAME_POSITION = 0
  FIRST_NAME_POSITION = 1
  FAVORITE_COLOR_POSITION = 2
  DATE_OF_BIRTH_POSITION = 3

  def initialize(data)
    @data = data
  end

  def record
    UserRecord.new({
      first_name: fields[FIRST_NAME_POSITION],
      last_name: fields[LAST_NAME_POSITION],
      favorite_color: fields[FAVORITE_COLOR_POSITION],
      date_of_birth: date
    })
  end

  def valid?
    fields.length == 4 && valid_date?
  end

  def fields
    @field ||= parse_data
  end

  private

  def parse_data
    @data.split(separator).map { |field| field.strip }
  end

  def valid_date?
    !date.nil?
  end

  def date
    @date ||= Date.strptime(fields[DATE_OF_BIRTH_POSITION], '%d/%m/%Y') rescue nil
  end

  def separator
    @data.include?(',') ? ',' : '|'
  end
end
