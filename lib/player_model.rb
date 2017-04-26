class Player

  attr_reader :name, :hp
  STARTING_HP = 60

  def initialize(name)
    @name = name
    @hp = STARTING_HP
  end

end
