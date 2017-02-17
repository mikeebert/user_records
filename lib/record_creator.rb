class RecordCreator

  def initialize(data)
    @data = data
  end

  def parse_data
    @data.split(separator).map { |field| field.strip }
  end

  private

  def separator
    @data.include?(',') ? ',' : '|'
  end
end
