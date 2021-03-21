input = [10, 16, 6, 0, 1, 17]

((input.length)...2020).each do |i|
  index = input[0...(input.length - 1)].rindex(input[-1])
  if index
    input.append(input.length - index - 1)
  else
    input.append(0)
  end
end

puts "2020th spoken number is #{input[-1]}"