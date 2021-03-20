amount_of_valid_passports = 0
required_fields = %w[ecl pid eyr hcl byr iyr hgt]
passport = []

File.foreach("input.txt") do |line|
  if line == "\n"
    if (required_fields - passport).empty?
      amount_of_valid_passports += 1
    end
    passport = []
  else
    line.split.each { |field| passport.append(field.split(":")[0]) }
  end
end

if (required_fields - passport).empty?
  amount_of_valid_passports += 1
end

puts "amount of valid passports: #{amount_of_valid_passports}"