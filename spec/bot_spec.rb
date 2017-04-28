require 'bot'

describe Bot do
  let(:bot) { described_class.new }

  it 'is a bot' do
    expect(bot.class).to eq Bot
  end

  it 'can play' do
    expect(subject).to respond_to(:play)
  end

  it 'takes damage' do
    expect { bot.take_damage(10) }.to change { bot.hp }.by(-10)
  end
end
