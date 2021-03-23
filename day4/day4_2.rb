amount_of_valid_passports = 0
required_fields = %w[ecl pid eyr hcl byr iyr hgt]
passport = []

def check_field(field)
  case field[0]
  when "byr"
    if field[1].to_i.between?(1920, 2020)
      return true
    else
      return false
    end
  when "iyr"
    if field[1].to_i.between?(2010, 2020)
      return true
    else
      return false
    end
  when "eyr"
    if field[1].to_i.between?(2020, 2030)
      return true
    else
      return false
    end
  when "hgt"
    if (field[1].match(/^\d+cm$/) and field[1][/^\d+/].to_i.between?(150, 193)) or (field[1].match(/^\d+in$/) and field[1][/^\d+/].to_i.between?(59, 76))
      return true
    else
      return false
    end
  when "hcl"
    if field[1].match(/^#[\da-f]{6}$/)
      return true
    else
      return false
    end
  when "ecl"
    if %w[amb blu brn gry grn hzl oth].include?(field[1])
      return true
    else
      return false
    end
  when "pid"
    if field[1].match(/^\d{9}$/)
      return true
    else
      return false
    end
  else
    return true
  end
end

File.foreach("input.txt") do |line|
  if line == "\n"
    if (required_fields - passport).empty?
      amount_of_valid_passports += 1
    end
    passport = []
  else
    line.split.each do |field|
      f = field.split(":")
      if check_field(f)
        passport.append(f[0])
      end
    end
  end
end

if (required_fields - passport).empty?
  amount_of_valid_passports += 1
end

puts "amount of valid passports: #{amount_of_valid_passports}"