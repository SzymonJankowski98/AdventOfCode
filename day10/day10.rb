file = File.open("input.txt")
numbers = file.readlines.map { |number|
  number.chop
  number.to_i
}
file.close

numbers.sort!

(numbers.length - 1).downto(1).each do |i|
  numbers[i] -= numbers[i-1]
end

puts numbers.count(1) * (numbers.count(3) + 1)