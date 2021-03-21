file = File.open("input.txt")
arrival_time = file.gets.to_i
buses = file.gets
buses = buses.split(',')
buses.delete('x')
buses.map!(&:to_i)
file.close

picked_bus_id = buses[0]
buses.drop(1).each do |bus|
  if bus - arrival_time % bus < picked_bus_id - arrival_time % picked_bus_id
    picked_bus_id = bus
  end
end

puts "bus id multiplied by the number of minutes: #{picked_bus_id * (picked_bus_id - arrival_time % picked_bus_id)}"