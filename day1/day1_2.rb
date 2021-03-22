input = File.read("input.txt").split
input.map! { |elem| elem.to_i }

#part1
(0...input.length).each { |i|
  ((i + 1)...input.length).each { |j|
    ((i + 2)...input.length).each { |k|
      if input[i] + input[j] + input[k]  == 2020
        puts "#{input[i]} * #{input[j]} * #{input[k]} = #{(input[i] * input[j] * input[k])}"
        return
      end
    }
  }
}