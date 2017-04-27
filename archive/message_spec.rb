require 'message'

describe Message do
  let(:player1) { double :player1, name: 'P1' }

  context 'turn strings' do
    it 'knows it\'s type' do
      message = Message.new(player1,:turn)
      expect(message.type).to eq :turn
    end
    it 'has a turn string' do
      message = Message.new(player1,:turn)
      expect(message.message_string).to eq 'P1\'s turn!'
    end
  end
end
