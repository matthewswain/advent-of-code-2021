def count_increasing(window_size, values)
  increasing = 0

  (window_size..values.length).each do |i|
    increasing += 1 if values[i - window_size...i].sum < values[i - window_size + 1..i].sum
  end

  increasing
end

values = File.readlines('input').map! { |line| line.strip.to_i }
puts "Part 1: #{count_increasing(1, values)}"
puts "Part 2: #{count_increasing(3, values)}"
