class Player
  attr_reader :name
  attr_accessor :hp
  STARTING_HP = 100

  def initialize(name)
    @name = name
    @hp = STARTING_HP
  end

  def take_damage(hit)
    @hp -= hit
  end

  def restore_health(health)
    @hp += health
  end
end
