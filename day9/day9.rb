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

file = File.open("input.txt")

(0...25).each do
  $previous_numbers.append(file.gets.to_i)
end

while (number = file.gets.to_i) do
  unless check_if_number_is_valid(number)
    puts "first invalid number is: #{number}"
    file.close
    break
  end
  $previous_numbers.append(number)
  $previous_numbers.slice!(0)
end

file.close