require 'rspec'
require_relative 'main'

input = '0,9 -> 5,9
8,0 -> 0,8
9,4 -> 3,4
2,2 -> 2,1
7,0 -> 7,4
6,4 -> 2,0
0,9 -> 2,9
3,4 -> 1,4
0,0 -> 8,8
5,5 -> 8,2'

describe('A solution to day five') do
  before do
    @input = parse_input(input)
  end

  it('parses the input') do
    first_xy = @input[0][0]
    expect(first_xy).to eq([0, 9])
  end

  it('fills in a line in') do
    line = fill_line(@input[0])
    expect(line).to eq([[0, 9], [1, 9], [2, 9], [3, 9], [4, 9], [5, 9]])
  end

  it('solves part one') do
    answer = solve_part_one(@input)
    expect(answer).to eq(5)
  end

  it('solves part two') do
    answer = solve_part_two(@input)
    expect(answer).to eq(12)
  end
end
