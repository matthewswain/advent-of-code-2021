#!/usr/bin/env ruby

def parse_input(input)
  input.split("\n").map do |line|
    parts = line.strip.split
    [parts[0], parts[1].to_i]
  end
end

def solve_part_one(input)
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
  x * y
end

def solve_part_two(input)
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
  x * y
end

if __FILE__ == $PROGRAM_NAME
  input = parse_input($stdin.read)
  puts "Part 1: #{solve_part_one(input)}"
  puts "Part 2: #{solve_part_two(input)}"
end
