input = File.read("input.txt").split
input.map! { |elem| elem.to_i }

#part1
(0...input.length).each { |i|
  ((i + 1)...input.length).each { |j|
    if input[i] + input[j] == 2020
      puts "#{input[i]} + #{input[j]} = #{(input[i] * input[j])}"
      return
    end
  }
}