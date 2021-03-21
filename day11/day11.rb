$seats = []

def change_seat_state(s_x, s_y)
  if $seats[s_x][s_y] == '.'
    return '.'
  end

  x = [-1, 0, 1]
  y = [-1, 0, 1]
  occupied_neighbours = 0

  x.each do |i|
    y.each do |j|
      #print i.to_s + " " + j.to_s + " " + (s_x + i).between?(0, $seats[0].length - 1).to_s + " " + (s_y + j).between?(0, $seats.length - 1).to_s + " " + ($seats[s_x + i][ s_x + j] == '#').to_s + " \n"
      if (i != 0 or j != 0) and (s_x + i).between?(0, $seats.length - 1) and (s_y + j).between?(0, $seats[0].length - 1) and $seats[s_x + i][ s_y + j] == '#'
        occupied_neighbours += 1
        if $seats[s_x][s_y] == 'L'
          return 'L'
        end

        if occupied_neighbours >= 4
          return 'L'
        end
      end
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