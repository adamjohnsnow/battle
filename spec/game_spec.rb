require 'game'

describe Game do
  let(:player1) { double :player1 }
  let(:player2) { double :player2 }
  let(:game) { described_class.new(player1, player2) }
  before { allow(player1).to receive(:take_damage) }
  before { allow(player2).to receive(:take_damage) }

  describe '#attack' do
    it 'should hit player 2' do
      expect(player2).to receive(:take_damage)
      game.attack
    end
    it 'should switch turns' do
      game.attack
      expect(game.current_turn).to eq(player2)
    end
    it 'should switch turns back' do
      game.attack
      game.attack
      expect(game.current_turn).to eq(player1)
    end
  end
end
