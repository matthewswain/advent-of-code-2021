#!/usr/bin/env ruby

def parse_input(input)
  input.split(',').map(&:to_i)
end

def solve(input, days)
  timers = Hash.new(0)
  input.each { timers[_1] += 1 }

  days.times do
    new_timers = Hash.new(0)
    timers.each_pair do |key, value|
      if key.zero?
        new_timers[6] += value
        new_timers[8] += value
      else
        new_timers[key - 1] += value
      end
    end
    timers = new_timers
  end
  timers.values.sum
end

if __FILE__ == $PROGRAM_NAME
  input = parse_input($stdin.read)
  puts solve(input, 18)
  puts solve(input, 256)
end
