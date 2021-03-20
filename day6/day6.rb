sum = 0
yes_answers = Set.new

File.foreach("input.txt") do |line|
  if line == "\n"
    sum += yes_answers.length
    yes_answers = Set.new
  else
    line.chop!
    chars = line.split('')
    chars.each { |char| yes_answers.add(char) }
  end
end

sum += yes_answers.length

puts "sum is: #{sum}"