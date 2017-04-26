require 'player_model'

describe Player do

player = described_class.new('Filipe')

  it 'returns a name' do
      expect(player.name).to eq 'Filipe'
  end

end
