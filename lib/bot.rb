require_relative './player_model'
require_relative './chance'
require_relative './game'

class Bot
  attr_reader :name
  attr_accessor :hp

  STARTING_HP = Player::STARTING_HP
  MIN_HP = Chance::MAXIMUM_PTS

  def initialize
    @name = ['The Rock', 'Stone Cold', 'Triple H'].sample
    @hp = STARTING_HP
  end

  def play
    @hp <= MIN_HP ? bot_heal : bot_attack
  end

  def take_damage(hit)
    @hp -= hit
  end

  def restore_health(health)
    @hp += health
  end

  def bot_attack
    Game.instance.attack
  end

  def bot_heal
    Game.instance.heal
  end
end
