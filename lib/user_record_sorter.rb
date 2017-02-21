class UserRecordSorter
  def self.sort_by_last_name_descending(records)
    records.sort_by { |r| r.last_name }.reverse
  end

  def self.sort_by_birth_date(records)
    records.sort_by { |r| r.date_of_birth }
  end

  def self.sort_by_color_and_last_name(records)
    records.sort do |a, b|
      comparison = (b.favorite_color <=> a.favorite_color)
      comparison.zero? ? (a.last_name <=> b.last_name) : comparison
    end
  end
end
