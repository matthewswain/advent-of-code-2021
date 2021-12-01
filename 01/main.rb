previous = nil
increasing = 0

File.readlines('input').each do |line|
  value = line.strip.to_i
  increasing += 1 if !previous.nil? && value > previous
  previous = value
end

puts increasing
