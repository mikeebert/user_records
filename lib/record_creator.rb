class RecordCreator

  def initialize(data)
    @data = data
  end

  def valid?
    fields.length == 4
  end

  def fields
    @field ||= parse_data
  end

  private

  def parse_data
    @data.split(separator).map { |field| field.strip }
  end

  def separator
    @data.include?(',') ? ',' : '|'
  end
end
