horizontal_positions = [0, 0, 0, 0, 0]
tree_counters = [0, 0, 0, 0, 0]
shift = [1, 3, 5, 7, 1]

line_number = 1
File.foreach("input.txt") do |line|
  (0...5).each do |rote|
    if rote != 4 or line_number.odd?
      if line[horizontal_positions[rote]] == "#"
        tree_counters[rote] += 1
      end
      horizontal_positions[rote] = (horizontal_positions[rote] + shift[rote]) % (line.length - 1)
    end
  end
  line_number += 1
end

puts "encountered tress: #{tree_counters.inject(:*)}"