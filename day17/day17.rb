$pocket_dimension = {}

x, y, z = '', '', 0
File.foreach("input.txt") do |line|
  line.chop!
  if x == ''
    x = -(line.length / 2).floor
    y = (line.length / 2).floor
  end
  line.split('').each do |char|
    if char == '#'
      $pocket_dimension[[x, y, z]] = '#'.to_sym
    end
    x += 1
  end
  x = -(line.length / 2).floor
  y -= 1
end

x_y_max, z_max = -x + 1, 1

def count_neighbours(position)
  number_of_neighbours = 0
  (-1..1).each do |x|
    (-1..1).each do |y|
      (-1..1).each do |z|
        if (x != 0 or y != 0 or z != 0) and $pocket_dimension[[position[0] + x, position[1] + y, position[2] + z]]
          number_of_neighbours += 1
        end
      end
    end
  end
  number_of_neighbours
end

(0...6).each do
  new_pocket_dimension = {}
  (-x_y_max..x_y_max).each do |i_x|
    (-x_y_max..x_y_max).each do |i_y|
      (-z_max..z_max).each do |i_z|
        number_of_neighbours = count_neighbours([i_x, i_y, i_z])
        if ($pocket_dimension[[i_x, i_y, i_z]] and number_of_neighbours.between?(2, 3)) or (!$pocket_dimension[[i_x, i_y, i_z]] and number_of_neighbours == 3)
          new_pocket_dimension[[i_x, i_y, i_z]] = '#'.to_sym
        end
      end
    end
  end
  $pocket_dimension = new_pocket_dimension
  x_y_max += 1
  z_max += 1
end

print $pocket_dimension.length