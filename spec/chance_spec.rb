require 'chance'

describe Chance do
  it 'generates big number' do
    srand(123)
    expect(Chance.roll).to eq Chance::MAXIMUM_PTS
  end

  it 'generates medium number' do
    srand(111)
    expect(Chance.roll).to eq Chance::MEDIUM_PTS
  end

  it 'generates medium number' do
    srand(999)
    expect(Chance.roll).to eq Chance::MINIMUM_PTS
  end
end
