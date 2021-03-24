$bags_list = {}

def how_many_contains(bag_name)
  sum = 0
  if $bags_list[bag_name]
    $bags_list[bag_name].each do |bag|
      if $bags_list[bag[1]]
        sum += bag[0] + bag[0] * how_many_contains(bag[1])
      else
        sum += bag[0]
      end
    end
  end
  sum
end

File.foreach("input.txt") do |line|
  line.chop!.chop!
  bag_name, bag_contain = line.split(" bags contain")
  if bag_contain != " no other bags"
    bags_set = []
    bag_contain.gsub!(/( bag(s)?)/, '').split(',').each { |bag|
      bag.lstrip!
      bags_set.append([bag[0].to_i, bag[2..]])
    }
    $bags_list[bag_name] = bags_set
  end
end


puts "amount of bags: #{how_many_contains("shiny gold")}"