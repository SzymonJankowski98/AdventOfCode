black_tiles = []

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
  if black_tiles.include?([x_position, y_position])
    black_tiles.delete([x_position, y_position])
  else
    black_tiles.append([x_position, y_position])
  end
end

puts black_tiles.length