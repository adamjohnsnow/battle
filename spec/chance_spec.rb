require 'chance'

describe Chance do
  context 'hit points' do
    it 'generates big number' do
      srand(123)
      expect(Chance.roll).to eq Chance::MAXIMUM_PTS
    end

    it 'generates medium number' do
      srand(111)
      expect(Chance.roll).to eq Chance::MEDIUM_PTS
    end

    it 'generates small number' do
      srand(999)
      expect(Chance.roll).to eq Chance::MINIMUM_PTS
    end
  end

  context 'hit message' do
    it 'generates slap message' do
      srand(111)
      expect(Chance.hit_msg).to eq 'got a slap in the face!'
    end

    it 'generates kick message' do
      srand(1020)
      expect(Chance.hit_msg).to eq 'got kicked in the shin!'
    end

    it 'generates noogie message' do
      srand(123)
      expect(Chance.hit_msg).to eq 'got a noogie!'
    end
  end

  context 'critical message' do
    it 'generates powerbomb message' do
      srand(111)
      expect(Chance.crit_msg).to eq 'GOT POWERBOMBED ON THE APRON!'
    end

    it 'generates superplex message' do
      srand(1020)
      expect(Chance.crit_msg).to eq 'GOT SUPERPLEXED OFF THE TOP TURNBUCKLE!'
    end

    it 'generates ddt message' do
      srand(123)
      expect(Chance.crit_msg).to eq 'GOT A DDT ON THE ARENA FLOOR!'
    end
  end

end
