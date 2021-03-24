$previous_numbers = []

def check_if_number_is_valid(number)
  (0...$previous_numbers.length).each do |i|
    (i...$previous_numbers.length).each do |j|
      if $previous_numbers[i] + $previous_numbers[j] == number
        return true
      end
    end
  end
  false
end

def part_2(number)
  numbers_group = []
  File.foreach("input.txt") do |num|
    numbers_group.append(num.to_i)
    until numbers_group.sum <= number
      numbers_group.slice!(0)
    end
    if numbers_group.sum == number
      return numbers_group.min + numbers_group.max
    end
  end
end

file = File.open("input.txt")

(0...25).each do
  $previous_numbers.append(file.gets.to_i)
end

while (number = file.gets.to_i) do
  unless check_if_number_is_valid(number)
    file.close
    puts part_2(number)
    break
  end
  $previous_numbers.append(number)
  $previous_numbers.slice!(0)
end

file.close