@rules = { }
messages = []

def generate_regex(start_rule)
  regex = @rules[start_rule].join(';')
  while (match = regex.match(/\d+/))
    match = match.to_s
    if @rules[match][0][0].match(/\D+/)
      regex.sub!(match, @rules[match][0][0])
    else
      if @rules[match].length == 2
        if @rules[match][0].length > 1
          regex.sub!(match, '(' + @rules[match][0][0] + ';' + @rules[match][0][1] + '|' + @rules[match][1][0] + ';' + @rules[match][1][1] + ')')
        else
          regex.sub!(match, '(' + @rules[match][0][0] + '|' + @rules[match][1][0] + ')')
        end
      else
        if @rules[match][0].length > 1
          regex.sub!(match, @rules[match][0][0] + ';' + @rules[match][0][1])
        else
          regex.sub!(match, @rules[match][0][0])
        end
      end
    end
  end
  regex.gsub!(';', '')
end


messages_start = false
File.open("input.txt").each do |line|
  if line == "\n"
    messages_start = true
    next
  end
  line.chop!
  if messages_start
    messages.append(line)
  else
    rule_id, rule = line.split(':')
    rule = rule.split('|')
    grouped_elements = []
    rule.each { |elem|
      if elem[1] == "\""
        grouped_elements.append(elem[2])
      else
        grouped_elements.append(elem.split)
      end
    }
    @rules[rule_id] = grouped_elements
  end
end

regex = generate_regex("0")
messages_counter = 0

messages.each do |message|
  if message.match(/^#{regex}$/)
    messages_counter += 1
  end
end

puts "number of valid messages: #{messages_counter}"