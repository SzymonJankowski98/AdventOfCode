input = []

class Password
  @@amount_of_correct_passwords = 0
  def initialize(line)
    line = line.split
    @password = line[2]
    @required_character = line[1].chop
    @min = line[0].split("-")[0].to_i
    @max = line[0].split("-")[1].to_i
  end

  def print_password
    puts "#{@min} #{@max} #{@required_character} #{@password}"
  end

  def check_password
    if @password.count(@required_character).between?(@min, @max)
      @@amount_of_correct_passwords += 1
    end
  end

end

File.foreach("input.txt") { |line| Password.new(line).check_password }

puts "amount of valid passwords: #{Password.class_variable_get(:@@amount_of_correct_passwords)}"