sum = 0
yes_answers = []

assign_answers = true
File.foreach("input.txt") do |line|
  if line == "\n"
    sum += yes_answers.length
    yes_answers = []
    assign_answers = true
  else
    line.chop!
    chars = line.split('')
    if assign_answers
      yes_answers = chars
      assign_answers = false
    else
      yes_answers = chars & yes_answers
    end
  end
end

sum += yes_answers.length

puts "sum is: #{sum}"