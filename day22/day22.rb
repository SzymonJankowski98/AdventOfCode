player1, player2 = [], []
next_player = false
File.foreach("input.txt") do |line|
  if line == "\n"
    next_player = true
  end
  if line.match(/^\d/)
    if next_player
      player2.append(line.chop.to_i)
    else
      player1.append(line.chop.to_i)
    end
  end
end

until player1.empty? or player2.empty?
  player1_card = player1.shift
  player2_card = player2.shift
  if player1_card > player2_card
    player1.append(player1_card, player2_card)
  else
    player2.append(player2_card, player1_card)
  end
end

result = 0

(1..player1.length).each do |i|
  result += player1[-i] * i
end
(1..player2.length).each do |i|
  result += player2[-i] * i
end

print result