require 'player_model'

describe Player do
  player = described_class.new('Filipe')

  it 'returns a name' do
    expect(player.name).to eq 'Filipe'
  end

  it 'takes damage' do
    expect { player.take_damage(10) }.to change { player.hp }.by(-10)
  end
end
