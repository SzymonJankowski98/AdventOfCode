@tiles = {}

new_tile = ["", "", "", ""]
tile_id = 0
row_count = 0

def count_neighbours(tile_id)
  amount_of_neighbours = 0
  tile = @tiles[tile_id]
  @tiles.values.each do |i|
    (0...4).each do |j|
      (0...4).each do |k|
        if tile[j] == i[k] or tile[j].reverse == i[k]
          amount_of_neighbours += 1
        end
      end
    end
  end
  amount_of_neighbours - 4
end

File.foreach("input.txt") do |line|
  if line[/\d+/]
    tile_id = line[/\d+/]
    row_count = 0
  elsif line == "\n"
    @tiles[tile_id] = new_tile
    new_tile = ["", "", "", ""]
  else
    line.chop!
    row_count += 1
    if row_count == 1
      new_tile[0] = line
    end
    if row_count == 10
      new_tile[3] = line
    end
    new_tile[1] += line[0]
    new_tile[2] += line[-1]
  end
end

corners = []

@tiles.keys.each do |tile|
  if count_neighbours(tile) == 2
    corners.append(tile.to_i)
  end
end

puts corners.inject(:*)