#!/usr/bin/env ruby

def parse_input(input)
  parts = input.split("\n\n")
  calls = parts[0].split(',').map &:to_i
  boards = parts[1..].map { Board.new(_1) }
  [calls, boards]
end

class Board
  def initialize(input)
    @values = input.split("\n").map { |line| line.split.map(&:to_i) }.flatten
    @called = []
  end

  def rows
    @values.each_slice(Math.sqrt(@values.length))
  end

  def columns
    rows.to_a.transpose
  end

  def call(number)
    @called << number if @values.include? number
  end

  def bingo?
    (rows + columns).map { |line| return true if line.all? { |value| @called.include? value } }
    false
  end

  def score
    @values.reject { |value| @called.include? value }.sum * @called[-1]
  end
end

def solve_part_one(calls, boards)
  calls.each do |call|
    boards.each do |board|
      board.call(call)
      return board.score if board.bingo?
    end
  end
  raise 'Didn\'t find a winner'
end

def find_losing_board(calls, boards)
  calls.each do |call|
    boards.reject! do |board|
      board.call(call)
      board.bingo?
    end
    return boards[0] if boards.length == 1
  end
  raise 'Didn\'t find a loser'
end

def solve_part_two(calls, boards)
  board = find_losing_board(calls, boards)
  solve_part_one(calls, [board])
end

if __FILE__ == $PROGRAM_NAME
  calls, boards = parse_input($stdin.read)
  puts solve_part_one(calls, boards)
  puts solve_part_two(calls, boards)
end
