accumulator = 0
instruction_counter = 0

program = []
executed_lines = []

File.foreach("input.txt") do |line|
  line.chop!
  instruction = line.split
  instruction[1] = instruction[1].to_i
  program.append(instruction)
end

while instruction_counter < program.length
  if executed_lines.include? instruction_counter
    break
  end
  executed_lines.append(instruction_counter)
  case program[instruction_counter][0]
  when "acc"
    accumulator += program[instruction_counter][1]
    instruction_counter += 1
  when "jmp"
    instruction_counter += program[instruction_counter][1]
  else
    instruction_counter += 1
  end
end

puts "acumulator value: #{accumulator}"