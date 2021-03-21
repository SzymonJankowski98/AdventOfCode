mask = ''
memory = {}

def apply_mask(mask, number)
  (0...number.length).each do |i|
    if mask[i] == '0'
      number[i] = '0'
    end

    if mask[i] == '1'
      number[i] = '1'
    end
  end
  number
end

File.foreach("input.txt") do |line|
  instr = line.delete('=').split
  if instr[0] == "mask"
    mask = instr[1]
  else
    address = instr[0][/\d+/].to_i
    number = instr[1].to_i.to_s(2).rjust(36, '0')
    memory[address] = apply_mask(mask, number).to_i(2)
  end
end

puts "sum equals: #{memory.values.sum}"