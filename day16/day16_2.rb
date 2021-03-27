@ranges = []
@potential_fields = []
def check_if_in_range(number)
  @ranges.each do |range|
    if number.between?(range[0], range[1])
      return true
    end
  end
  false
end

def update_potential_fields(number, field_id)
  (0...(@ranges.length / 2)).each do |i|
    unless number.between?(@ranges[i * 2][0], (@ranges[i * 2][1])) or number.between?(@ranges[i * 2 + 1][0], (@ranges[i * 2 + 1][1]))
      @potential_fields[i].delete(field_id)
    end
  end
end

nearby_tickets_start = false
your_ticket = []

File.foreach("input.txt") do |line|
  if nearby_tickets_start
    next unless line.split(",").each do |number|
      break unless check_if_in_range(number.to_i)
    end
    line.split(",").each_with_index do |number, i|
      update_potential_fields(number.to_i, i)
    end
  else
    if line[/\d+,\d+/]
      your_ticket = line.split(',').map(&:to_i)
    end
    if line[/\d+-\d+/]
      if line[/^departure/]
        @ranges.unshift(line[/\d+-\d+/].split("-").map(&:to_i))
      else
        @ranges.append(line[/\d+-\d+/].split("-").map(&:to_i))
      end
    end
    if line[/\d+-\d+$/]
      if line[/^departure/]
        @ranges.unshift(line[/\d+-\d+$/].split("-").map(&:to_i))
      else
        @ranges.append(line[/\d+-\d+$/].split("-").map(&:to_i))
      end
    end
  end

  if line == "nearby tickets:\n"
    nearby_tickets_start = true
    @potential_fields = Array.new(@ranges.length / 2) { (0...(@ranges.length / 2)).to_a }
  end
end

i = 0
reset = false
while i < @potential_fields.length do
  if @potential_fields[i].length == 1
    @potential_fields.map do |field|
      if field.length > 1
        if field.delete(@potential_fields[i][0])
          reset = true
        end
      end
    end
  end
  i += 1
  if reset
    reset = false
    i = 0
  end
end

result = 1
(0...6).each do |j|
  result *= your_ticket[@potential_fields[j][0]]
end

puts result