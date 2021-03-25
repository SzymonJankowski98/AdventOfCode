input = [10, 16, 6, 0, 1, 17]

dictionary = {}
(0...input.length-1).each { |i| dictionary[input[i]] = i }

((input.length)...30000000).each do |i|
  if dictionary[input[-1]]
    input.append(input.length - dictionary[input[-1]] - 1)
    dictionary[input[-2]] = i - 1
  else
    input.append(0)
    dictionary[input[-2]] = i - 1
  end
end

puts "2020th spoken number is #{input[-1]}"