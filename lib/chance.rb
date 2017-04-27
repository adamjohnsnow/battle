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
end
