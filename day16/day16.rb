@ranges = []

def check_if_in_range(number)
  @ranges.each do |range|
    if number.between?(range[0], range[1])
      return true
    end
  end
  false
end

nearby_tickets_start = false
invalid_sum = 0

File.foreach("input.txt") do |line|
  if nearby_tickets_start
    line.split(",").each do |number|
      unless check_if_in_range(number.to_i)
        invalid_sum += number.to_i
      end
    end
  else
    if line[/\d+-\d+/]
      @ranges.append(line[/\d+-\d+/].split("-").map(&:to_i))
    end
    if line[/\d+-\d+$/]
      @ranges.append(line[/\d+-\d+$/].split("-").map(&:to_i))
    end
  end

  if line == "nearby tickets:\n"
    nearby_tickets_start = true
  end
end

puts invalid_sum