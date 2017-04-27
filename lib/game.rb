class Game
  attr_reader :players, :order, :player_one, :player_two

  def self.start(player_one, player_two)
    @game = Game.new(player_one, player_two)
  end

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @players = [player_one, player_two]
  end

  def self.instance
    @game
  end

  def attack(hit)
    @players[1].take_damage(hit)
  end

  def switch_turns
    @players.reverse!
  end

  def heal(health)
    @players[0].restore_health(health)
  end
end
