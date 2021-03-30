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

number_of_combinations = 1

def number_of_ones(n)
  if n > 3
    return 2 ** (n - 2) - (2 ** (n - 4) - 1)
  elsif n == 3
    return 2
  end
  1
end

i = 0
counter = 1
numbers.each do |number|
  if number == 1
    counter += 1
  else
    number_of_combinations *= number_of_ones(counter)
    counter = 1
  end
end
number_of_combinations *= number_of_ones(counter)
puts number_of_combinations
