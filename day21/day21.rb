@foods = []
all_ingredients = Set.new

File.foreach("input.txt") do |line|
  @foods.append([line[/^.+\(/].chop.split.sort, line[/\(contains.+\)\n$/].gsub(' ','').delete_suffix(")\n").delete_prefix("(contains").split(',').sort])
  @foods[-1][0].each { |ingredient| all_ingredients.add?(ingredient)}
end

def delete_pair(ingredient, allergen)
  @foods.each do |food|
    if food[0].include?(ingredient)
      food[0].delete(ingredient)
    end
    if food[1].include?(allergen)
      food[1].delete(allergen)
    end
  end
end

def find_bad_ingredients
  bad_ingredients= Set.new
  @foods.each do |food|
    if food[1].length == 1
      food[0].each{ |ingredient| bad_ingredients.add(ingredient)}
    end
  end
  bad_ingredients
end

i = 0
while i < @foods.length
  ((i+1)...@foods.length).each do |j|
    common_ingredients = (@foods[i][0] & @foods[j][0]).sort
    common_allergens = (@foods[i][1] & @foods[j][1]).sort
    if common_ingredients.length > 0 and common_allergens.length > 0
      if common_ingredients.length == 1 and common_allergens.length == 1
        delete_pair(common_ingredients[0], common_allergens[0])
      end
      unless @foods.include?([common_ingredients, common_allergens])
        @foods.append([common_ingredients, common_allergens])
      end
    end
  end
  i += 1
end


file = File.open("input.txt")
input = file.read.split
counter = 0
(all_ingredients - find_bad_ingredients).each do |ingredient|
  counter += input.count(ingredient)
end
file.close

print counter