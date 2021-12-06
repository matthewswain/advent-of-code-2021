require 'rspec'
require_relative 'main'

raw_input = '3,4,3,1,2'

describe 'A solution to day six' do
  before do
    @input = parse_input(raw_input)
  end

  it 'solves part one' do
    answer = solve(@input, 80)
    expect(answer).to eq(5934)
  end

  it 'solves part two' do
    answer = solve(@input, 256)
    expect(answer).to eq(26_984_457_539)
  end
end
