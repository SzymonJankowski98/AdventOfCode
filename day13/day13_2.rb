file = File.open("input.txt")
arrival_time = file.gets.to_i
buses = file.gets
buses = buses.split(',')
buses.map! do |bus|
  if bus == 'x'
    -1
  else
    bus.to_i
  end
end
file.close

timestamp = 0
increment = 1
i = 0
while i < buses.length
  if buses[i] == -1
    i += 1
    next
  end
  timestamp += increment
  if (timestamp + i) % buses[i] == 0
    increment *= buses[i]
    i += 1
  end
end

puts timestamp