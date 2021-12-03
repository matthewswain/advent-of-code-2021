require 'rspec'
require_relative 'main'

input = '199
200
208
210
200
207
240
269
260
263'

describe 'A solution to day one' do
  it 'is correct for part one' do
    values = parse_input(input)
    answer = count_increasing(1, values)
    expect(answer).to eq(7)
  end

  it 'is correct for part two' do
    values = parse_input(input)
    answer = count_increasing(3, values)
    expect(answer).to eq(5)
  end
end
