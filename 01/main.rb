def count_increasing(window_size, values)
  previous = []
  increasing = 0

  values.each do |value|
    if previous.length < window_size
      previous.append value
      next
    end

    current = previous[1..] + [value]
    increasing += 1 if previous.sum < current.sum
    previous = current
  end

  increasing
end

values = File.readlines('input').map! { |line| line.strip.to_i }
puts "Part 1: #{count_increasing(1, values)}"
puts "Part 2: #{count_increasing(3, values)}"
