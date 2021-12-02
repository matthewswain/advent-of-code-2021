def count_increasing(window, values)
  totals = values.each_cons(window).map(&:sum)
  totals.each_cons(2).count { _1 < _2 }
end

values = File.readlines('input').map!(&:to_i)
puts "Part 1: #{count_increasing(1, values)}"
puts "Part 2: #{count_increasing(3, values)}"
