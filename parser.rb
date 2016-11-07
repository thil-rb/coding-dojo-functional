require_relative 'csv_reader'

class Parser
  def parse
    c = combine.curry.("hi there ")

    apply_change = -> (fn, name) { fn.call(name); }
    change_a_to_z = -> (name) { name.gsub("a", "z") }
    change_thil = -> (name) { name.gsub("thil", "god") }

    apply_a_to_z = apply_change.curry.call(change_a_to_z)
    thil_is_god = apply_change.curry.call(change_thil)

    CsvReader.new.read(:name, :age, :location) do |age:, name:, location:|
      p thil_is_god.(apply_a_to_z.(name))
    end
  end

  def combine
    -> (template, age) { template + age }
  end

  def max
    -> (name, age) { return name if age < 30 }
  end

  def render_proc(name, age, location)
    Proc.new { return "name #{name} #{age} #{location}" }
  end

  def render_lambda(name, age, location)
    -> { return "name #{name} #{age} #{location}" }
  end
end
