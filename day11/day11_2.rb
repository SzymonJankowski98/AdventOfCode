$seats = []

def neighbours
  # code here
end

def change_seat_state(s_x, s_y)
  if $seats[s_x][s_y] == '.'
    return '.'
  end

  occupied_neighbours = 0
  directions = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
  directions.each do |direction|
    direction_multiplier = 1
    while (s_x + direction[0] * direction_multiplier).between?(0, $seats.length - 1) and (s_y + direction[1] * direction_multiplier).between?(0, $seats[0].length - 1)
      neighbour = $seats[s_x + direction[0] * direction_multiplier][ s_y + direction[1] * direction_multiplier]
      if neighbour == 'L'
        break
      elsif neighbour == '#'
        occupied_neighbours += 1
        if $seats[s_x][s_y] == 'L'
          return 'L'
        end
        if occupied_neighbours >= 5
          return 'L'
        end
        break
      end
      direction_multiplier += 1
    end
  end
  '#'
end

File.foreach("input.txt") do |line|
  line.chop!
  $seats.append(line)
end

while true do
  new_iteration = []
  (0...$seats.length).each do |row|
    new_row = ""
    (0...$seats[0].length).each do |col|
      new_row += change_seat_state(row, col)
    end
    new_iteration.append(new_row)
  end

  if new_iteration != $seats
    $seats = new_iteration
  else
    break
  end
end

number_of_occupied_seats = 0

$seats.each do |row|
  number_of_occupied_seats += row.count("#")
end

puts "number of occupied seats: #{number_of_occupied_seats}"