class RecordCreator
  DATE_OF_BIRTH_POSITION = 3

  def initialize(data)
    @data = data
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
    @date ||= Date.parse(fields[DATE_OF_BIRTH_POSITION]) rescue nil
  end

  def separator
    @data.include?(',') ? ',' : '|'
  end
end
