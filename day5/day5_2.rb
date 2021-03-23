seats_id = []

File.foreach("input.txt") do |line|
  line.chop!
  seat_id = 0
  (0...10).each do |i|
    if %w[B R].include? line[-(i+1)]
      seat_id += 2 ** i
    end
  end
  seats_id.append(seat_id)
end

seats_id.sort!

(0...seats_id.length - 1).each do |i|
  if seats_id[i + 1] - seats_id[i] > 1
    puts seats_id[i + 1] - 1
  end
end