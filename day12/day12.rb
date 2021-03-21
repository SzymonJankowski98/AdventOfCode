#positive x is north and negative is south. positive y is west and negative is east
x_position, y_position = 0, 0

#N is 0, E is 90, S is 180 and W is 270
ship_degree = 90
direction_hash = {0 => [1, 0], 90 => [0, 1], 180 => [-1, 0], 270 => [0, -1]}

File.foreach("input.txt") do |instruction|
  argument = instruction[1..].to_i
  case instruction[0]
  when "N"
    x_position += argument
  when "S"
    x_position -= argument
  when "E"
    y_position += argument
  when "W"
    y_position -= argument
  when "L"
    ship_degree = (ship_degree + (360 - argument)) % 360
  when "R"
    ship_degree = (ship_degree + argument) % 360
  else
    x_position += argument * direction_hash[ship_degree][0]
    y_position += argument * direction_hash[ship_degree][1]
  end

  print x_position.to_s + " " + y_position.to_s + " " + instruction.chop + " " + ship_degree.to_s + "\n"
end

puts "Manhattan distance is:  #{x_position.abs + y_position.abs}"