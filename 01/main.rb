#!/usr/bin/env ruby

def parse_input(input)
  input.split("\n").map(&:to_i)
end

def count_increasing(window, values)
  totals = values.each_cons(window).map(&:sum)
  totals.each_cons(2).count { _1 < _2 }
end

if __FILE__ == $PROGRAM_NAME
  window = ARGV[0].to_i
  input = parse_input($stdin.read)
  puts count_increasing(window, input)
end
