class Chance
  attr_reader :options

  MINIMUM_PTS = 0
  MEDIUM_PTS = 10
  MAXIMUM_PTS = 30

  def self.roll
    options = [
      MINIMUM_PTS,
      MINIMUM_PTS,
      MEDIUM_PTS,
      MEDIUM_PTS,
      MEDIUM_PTS,
      MAXIMUM_PTS
    ]
    options[rand(0..(options.count - 1))]
  end

  def self.hit_msg
    options = [
      'got a slap in the face!',
      'got kicked in the shin!',
      'got a noogie!'
    ]
    options[rand(0..(options.count - 1))]
  end

  def self.crit_msg
    options = [
      'GOT POWERBOMBED ON THE APRON!',
      'GOT SUPERPLEXED OFF THE TOP TURNBUCKLE!',
      'GOT A DDT ON THE ARENA FLOOR!'
    ]
    options[rand(0..(options.count - 1))]
  end
end
