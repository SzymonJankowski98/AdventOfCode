door_key, card_key = File.read("input.txt").split

def get_loop_size(key, subject_number=7)
  start, loop_size = 1, 0
  while start != key
    start *= subject_number
    start %= 20201227
    loop_size += 1
  end
  loop_size
end

def calculate_encryption_key(subject_number, loop_size)
  key = 1
  (0...loop_size).each do
    key *= subject_number
    key %= 20201227
  end
  key
end


puts calculate_encryption_key(door_key.to_i, get_loop_size(card_key.to_i))