#positive x is north and negative is south. positive y is west and negative is east
ship_x_position, ship_y_position = 0, 0
waypoint_x_position, waypoint_y_position = 1, 10

def rotate_point(x, y, angle, start_x=0, start_y=0)
  angle = angle * Math::PI / 180
  x -= start_x
  y -= start_y

  new_x = x * Math.cos(angle) - y * Math.sin(angle)
  new_y = x * Math.sin(angle) + y * Math.cos(angle)

  [(new_x + start_x).round, (new_y + start_y).round]
end

File.foreach("input.txt") do |instruction|
  argument = instruction[1..].to_i
  case instruction[0]
  when "N"
    waypoint_x_position += argument
  when "S"
    waypoint_x_position -= argument
  when "E"
    waypoint_y_position += argument
  when "W"
    waypoint_y_position -= argument
  when "L"
    waypoint_x_position, waypoint_y_position = rotate_point(waypoint_x_position, waypoint_y_position, 360 - argument)
  when "R"
    waypoint_x_position, waypoint_y_position = rotate_point(waypoint_x_position, waypoint_y_position, argument)
  else
    ship_x_position += argument * waypoint_x_position
    ship_y_position += argument * waypoint_y_position
  end

  print ship_x_position.to_s + " " + ship_y_position.to_s + " " + instruction.chop + " " + waypoint_x_position.to_s + " " + waypoint_y_position.to_s + "\n"
end

puts "Manhattan distance is:  #{ship_x_position.abs + ship_y_position.abs}"