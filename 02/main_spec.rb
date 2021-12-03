require 'rspec'
require_relative 'main'

raw_input = 'forward 5
down 5
forward 8
up 3
down 8
forward 2'

describe 'A solution to day two' do
  it 'works for part one' do
    input = parse_input(raw_input)
    answer = solve_part_one(input)
    expect(answer).to eq(150)
  end

  it 'works for part two' do
    input = parse_input(raw_input)
    answer = solve_part_two(input)
    expect(answer).to eq(900)
  end
end
