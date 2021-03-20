amount_of_bags = 0
$bags_list = {}

def check_if_contains(bag_name)
  if $bags_list[bag_name]
    if $bags_list[bag_name].include? "shiny gold"
      return true
    else
      $bags_list[bag_name].each do |bag|
        if check_if_contains(bag)
          return true
        end
      end
    end
  else
    false
  end
  false
end

File.foreach("input.txt") do |line|
  line.chop!.chop!
  bag_name, bag_contain = line.split(" bags contain")
  if bag_contain != " no other bags" and bag_name != "shiny gold"
    bag_contain = bag_contain.split(',').each { |bag|
      bag.gsub!(/( bag(s)?)|( \d+)/, '')
      bag.lstrip!
    }
    $bags_list[bag_name] = bag_contain
  end
end

$bags_list.each do |bag|
  if check_if_contains(bag[0])
    amount_of_bags+=1
  end
end

puts "amount of bags: #{amount_of_bags}"