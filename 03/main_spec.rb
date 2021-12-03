require 'rspec'
require_relative 'main'

input = '00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010'

describe 'A solution to day three' do
  before do
    @values, @length = parse_input(input)
  end

  it 'works for part one' do
    answer = solve_part_one(@values, @length)
    expect(answer).to eq(198)
  end

  it 'should find the oxygen generator rating' do
    answer = find_oxygen_generator_rating(@values, @length)
    expect(answer).to eq(23)
  end

  it 'should find the oxygen scrubber rating' do
    answer = find_oxygen_scrubber_rating(@values, @length)
    expect(answer).to eq(10)
  end

  it 'works for part two' do
    answer = solve_part_two(@values, @length)
    expect(answer).to eq(230)
  end
end
