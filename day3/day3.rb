horizontal_position = 0
tree_counter = 0

File.foreach("input.txt") do |line|
  if line[horizontal_position] == "#"
    tree_counter += 1
  end
  horizontal_position = (horizontal_position + 3) % (line.length - 1)
end

puts "encountered tress: #{tree_counter}"