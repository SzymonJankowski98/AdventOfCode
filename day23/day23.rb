input = [5, 3, 8, 9, 1, 4, 7, 6, 2]

picked_number_id = 0
destination_number_id = 0
picked_up_numbers = []
(0...100).each do |i|
  puts (i+1).to_s + " ----------------------"
  picked_number = input[picked_number_id]
  print input.to_s + "\n"
  print picked_number.to_s + "\n"
  picked_up_numbers = [*picked_number_id + 1..picked_number_id + 3].map{ |k| input[k % input.length] }
  print picked_up_numbers.to_s + "\n"
  input -= picked_up_numbers
  destination_number = picked_number - 1
  until input.include?(destination_number) do
    if destination_number > 0
      destination_number -= 1
    else
      destination_number = input.length + 3
    end
  end
  print destination_number.to_s + "\n"
  destination_number_id = input.index(destination_number)
  input.insert(destination_number_id + 1, *picked_up_numbers)
  picked_number_id = (input.index(picked_number) + 1) % input.length
end

str = (input[(input.index(1)+1)..] + input[..input.index(1) - 1]).join

puts str
