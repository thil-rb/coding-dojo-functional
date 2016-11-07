require_relative 'csv_reader'

class Parser
  def parse
    p "Parsing!!!"
    CsvReader.new.read do |name|
      p "name #{name}"
    end
  end
end
