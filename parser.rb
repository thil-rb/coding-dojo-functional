class Parser
  def parse
    CsvReader.new.read do |name|
      p "name #{name}"
    end
  end
end
