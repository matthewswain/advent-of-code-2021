#!/usr/bin/env ruby

def parse_input(input)
  strings = input.split("\n")
  length = strings[0].length
  values = strings.map { _1.to_i(2) }
  [values, length]
end

def bit_in_position(value, position)
  (value >> position) % 2
end

def popular_bits(values, length)
  result = 0
  (0...length).each do |position|
    on = values.map { |value| bit_in_position(value, position) }.sum
    result += (on >= (values.length / 2.0) ? 1 << position : 0)
  end
  result
end

def opposite(value, length)
  value ^ ('1' * length).to_i(2)
end

def solve_part_one(values, length)
  gamma = popular_bits(values, length)
  gamma * opposite(gamma, length)
end

def find_oxygen_generator_rating(values, length)
  (0...length).reverse_each do |position|
    popular = popular_bits(values, length)
    values = values.select { |value| bit_in_position(value, position) == bit_in_position(popular, position) }
    return values[0] if values.length == 1
  end
  throw 'Rating not found'
end

def find_oxygen_scrubber_rating(values, length)
  (0...length).reverse_each do |position|
    popular = popular_bits(values, length)
    values = values.reject { |value| bit_in_position(value, position) == bit_in_position(popular, position) }
    return values[0] if values.length == 1
  end
  throw 'Rating not found'
end

def solve_part_two(values, length)
  find_oxygen_generator_rating(values, length) * find_oxygen_scrubber_rating(values, length)
end

if __FILE__ == $PROGRAM_NAME
  values, length = parse_input($stdin.read)
  puts solve_part_one(values, length)
  puts solve_part_two(values, length)
end
