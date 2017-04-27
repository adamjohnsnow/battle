class Player

  attr_reader :name
  attr_accessor :hp
  STARTING_HP = 60

  def initialize(name)
    @name = name
    @hp = STARTING_HP
  end

  def take_damage
    @hp -= 10
  end
  
end
