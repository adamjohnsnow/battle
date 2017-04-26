require 'game'

describe Game do


  let(:player1) { double :player1, hp: (10) }
  let(:player2) { double :player2, hp: (10) }

  describe '#attack' do
    it 'should hit player 2' do
      allow(:player2).to receive(:hp)
      game = described_class.new('test', player2)
      p game
      expect { game.attack(player2) }.to change { player2.hp }.by(-10)
    end
  end

end
