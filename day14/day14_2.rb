mask = ''
@memory = {}

def apply_mask(mask, number)
  (0...number.length).each do |i|
    if mask[i] == 'X'
      number[i] = 'X'
    end
    if mask[i] == '1'
      number[i] = '1'
    end
  end
  number
end

def save_values(address, val, i=0)
  (i...address.length).each do |j|
    if address[j] == 'X'
      new_address = address.dup
      new_address[j] = "1"
      save_values(new_address, val, i=j+1)
      new_address[j] = "0"
      save_values(new_address, val, i=j+1)
      return
    end
  end
  @memory[address.to_i(2)] = val
end

File.foreach("input.txt") do |line|
  instr = line.delete('=').split
  if instr[0] == "mask"
    mask = instr[1]
  else
    address = instr[0][/\d+/].to_i
    number = instr[1].to_i
    save_values(apply_mask(mask, address.to_i.to_s(2).rjust(36, '0')), number)
  end
end

puts "sum equals: #{@memory.values.sum}"
