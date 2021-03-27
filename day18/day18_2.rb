def find_closing_parentheses (line)
  amount_of_closing_parentheses = 0
  amount_of_opening_parentheses = 1
  (0..line.length).each do |i|
    if line[i] == ')'
      amount_of_closing_parentheses += 1
    elsif line[i] == '('
      amount_of_opening_parentheses += 1
    end
    if amount_of_opening_parentheses == amount_of_closing_parentheses
      return i
    end
  end
end

def find_opening_parentheses (line)
  amount_of_closing_parentheses = 1
  amount_of_opening_parentheses = 0
  (line.length).downto(0) do |i|
    if line[i] == ')'
      amount_of_closing_parentheses += 1
    elsif line[i] == '('
      amount_of_opening_parentheses += 1
    end
    if amount_of_opening_parentheses == amount_of_closing_parentheses
      return i
    end
  end
end

def calculate(line)
  while (index = line.index('('))
    if line[index] == '('
      closing_par_index = find_closing_parentheses(line[(index + 1)..]) + index + 1
      line[(index)..closing_par_index] = calculate(line[(index + 1)...closing_par_index])
    end
  end
  until line.scan(/\D/).empty?
    single_operation = line[/\d+ [*+] \d+/]
    args = single_operation.split
    if args[1] == '+'
      line[...single_operation.length] = (args[0].to_i + args[2].to_i).to_s
    else
      line[...single_operation.length] = (args[0].to_i * args[2].to_i).to_s
    end
  end
  line
end

sum = 0

def add_parentheses(line)
  i = 0
  while i < line.length
    if line[i] == "+"
      if line[i + 2] == '('
        line.insert(find_closing_parentheses(line[(i + 3)..]) + i + 3, ')')
      else
        line.insert(i + 3, ')')
      end
      if line[i - 2] == ')'
        line.insert(find_opening_parentheses(line[..(i - 3)]), '(')
        i += 1
      else
        line.insert(i - 2, '(')
        i += 1
      end
    end
    i += 1
  end
  line
end

File.open("input.txt").each do |line|
  line.chop!
  sum += calculate(add_parentheses(line)).to_i
end

puts "sum equals to: #{sum}"