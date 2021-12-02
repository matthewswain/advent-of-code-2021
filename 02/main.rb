input = File.readlines('input').map do |line|
  parts = line.strip.split
  [parts[0], parts[1].to_i]
end

x, y = 0, 0
input.each do |direction, value|
  case direction
  when 'up' then x -= value
  when 'down' then x += value
  when 'forward' then y += value
  when 'back' then y -= value
  else raise "Invalid direction: #{direction}"
  end
end

puts "Part 1: #{x * y}"

x, y, aim = 0, 0, 0
input.each do |direction, value|
  case direction
  when 'up' then aim -= value
  when 'down' then aim += value
  when 'forward' then y += value; x += (aim * value)
  when 'back' then y -= value; x -= (aim * value)
  else raise "Invalid direction: #{direction}"
  end

end

puts "Part 2: #{x * y}"
