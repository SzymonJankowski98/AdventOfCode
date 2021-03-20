highest_seat_id = 0

File.foreach("input.txt") do |line|
  line.chop!
  seat_id = 0
  (0...10).each do |i|
    if %w[B R].include? line[-(i+1)]
      seat_id += 2 ** i
    end
  end
  if seat_id > highest_seat_id
    highest_seat_id = seat_id
    puts "#{highest_seat_id}, #{line}"
  end
end

puts "highest seat id is: #{highest_seat_id}"