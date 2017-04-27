require 'pry'

class Game
  attr_reader :players, :order

  def initialize(player_one, player_two)
    @players = [player_one, player_two]
    @order = order
  end

  def self.start(player_one, player_two)
    @game = Game.new(player_one, player_two)
  end

  def self.instance
    @game
  end

  def attack
    @players[1].take_damage
  end

  def switch_turns
    @players.reverse!
  end
end
