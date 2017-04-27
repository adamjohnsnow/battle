require 'game'

describe Game do

  let(:player1) { double :player, hp: 60 }
  let(:player2) { double :player, hp: 60 }
  let(:game) { described_class.new(player1, player2) }

  describe '#attack' do

    it 'should hit player 2' do
      expect(player2).to receive(:take_damage)
      game.attack(player2)
    end
  end

end
