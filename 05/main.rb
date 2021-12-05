#!/usr/bin/env ruby

def parse_input(input)
  input.split("\n").map do |line|
    line.split(' -> ').map do |xy|
      xy.split(',').map(&:to_i)
    end
  end
end

def fill_line(line)
  start, finish = line
  x1, y1 = start
  x2, y2 = finish

  filled = []
  x, y = x1, y1
  until filled[-1] == finish
    filled << [x, y]
    x -= x1 <=> x2
    y -= y1 <=> y2
  end
  filled
end

def diagonal?(line)
  start, finish = line
  x1, y1 = start
  x2, y2 = finish
  x1 != x2 and y1 != y2
end

def solve_part_one(input)
  lines = input.reject { |line| diagonal?(line) }.map { |line| fill_line(line) }
  coords = lines.flatten(1).sort
  coords.chunk_while { |a, b| a[0] == b[0] && a[1] == b[1] }.reject { _1.count <= 1 }.count
end

def solve_part_two(input)
  lines = input.map { |line| fill_line(line) }
  coords = lines.flatten(1).sort
  coords.chunk_while { |a, b| a[0] == b[0] && a[1] == b[1] }.reject { _1.count <= 1 }.count
end

if __FILE__ == $PROGRAM_NAME
  input = parse_input($stdin.read)
  puts solve_part_one(input)
  puts solve_part_two(input)
end
