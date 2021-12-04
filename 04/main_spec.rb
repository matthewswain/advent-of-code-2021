require 'rspec'
require_relative 'main'

input = '7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1

22 13 17 11  0
 8  2 23  4 24
21  9 14 16  7
 6 10  3 18  5
 1 12 20 15 19

 3 15  0  2 22
 9 18 13 17  5
19  8  7 25 23
20 11 10 24  4
14 21 16 12  6

14 21 17 24  4
10 16 15  9 19
18  8 23 26 20
22 11 13  6  5
 2  0 12  3  7'

describe 'A solution to day three' do
  before do
    @calls, @boards = parse_input(input)
    @calls = [7, 4, 9, 5, 11, 17, 23, 2, 0, 14, 21, 24]
  end

  it 'it parses the correct number of boards' do
    expect(@boards.length).to eq(3)
  end

  it 'identifies a winning board correctly' do
    @calls.each { |call| @boards[2].call(call) }
    winner = @boards[2].bingo?
    expect(winner).to eq(true)
  end

  it 'identifies a losing board correctly' do
    @calls.each { |call| @boards[1].call(call) }
    winner = @boards[1].bingo?
    expect(winner).to eq(false)
  end

  it 'calculates the score correctly' do
    @calls.each { |call| @boards[2].call(call) }
    score = @boards[2].score
    expect(score).to eq(4512)
  end

  it 'finds the score of the winning board' do
    score = solve_part_one(@calls, @boards)
    expect(score).to eq(4512)
  end

  it 'finds the score of the losing board' do
    @calls += [16, 10, 13]
    score = solve_part_two(@calls, @boards)
    expect(score).to eq(1924)
  end
end
