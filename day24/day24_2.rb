@black_tiles = Set.new

File.foreach("input.txt") do |tile|
  x_position = 0
  y_position = 0
  tile.chop!
  until tile.empty?
    case tile
    when /^e/
      tile.sub!("e", '')
      x_position += 2
    when /^se/
      tile.sub!("se", '')
      x_position += 1
      y_position -= 1
    when /^sw/
      tile.sub!("sw", '')
      x_position -= 1
      y_position -= 1
    when /^w/
      tile.sub!("w", '')
      x_position -= 2
    when /^nw/
      tile.sub!("nw", '')
      x_position -= 1
      y_position += 1
    else
      tile.sub!("ne", '')
      x_position += 1
      y_position += 1
    end
  end
  if @black_tiles.include?([x_position, y_position])
    @black_tiles.delete([x_position, y_position])
  else
    @black_tiles.add?([x_position, y_position])
  end
end

def count_black_neighbours(tile)
  neighbours = 0
  directions = [[-2, 0], [2, 0], [-1, 1], [-1, -1], [1, 1], [1, -1]]
  directions.each do |x, y|
    if @black_tiles.include?([tile[0] + x, tile[1] + y])
      neighbours += 1
    end
  end
  neighbours
end

(1..100).each do |day|
  next_day = Set.new
  @black_tiles.each do |tile|
    if count_black_neighbours(tile).between?(1, 2)
      next_day.add?(tile)
    end
    directions = [[-2, 0], [2, 0], [-1, 1], [-1, -1], [1, 1], [1, -1]]
    directions.each do |x, y|
      if count_black_neighbours([tile[0] + x, tile[1] + y]) == 2
        next_day.add?([tile[0] + x, tile[1] + y])
      end
    end
  end
  @black_tiles = next_day
  puts "day " + day.to_s + ": " + @black_tiles.length.to_s + "\n"
end