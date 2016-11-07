require 'csv'

class CsvReader
  def read(*keys)
    csv = CSV.new(File.read('users.csv'), headers: true, header_converters: :symbol).to_a
    csv.each do |line|
      values = line.to_h.select { |key| keys.include?(key) }

      yield **values if block_given?
    end
  end
end
