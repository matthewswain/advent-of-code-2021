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
