require_relative './game'

class Game
  attr_reader :players, :last_move, :player_one, :player_two

  def self.start(player_one, player_two)
    @game = Game.new(player_one, player_two)
  end

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @last_move = ''
    @players = [player_one, player_two]
  end

  def self.instance
    @game
  end

  def attack
    hit = Chance.roll
    @players[1].take_damage(hit)
    @last_move = hit_msg(hit)
  end

  def heal
    health = Chance.roll
    @players[0].restore_health(health)
    @last_move = heal_msg(health)
  end

  def switch_turns
    @players.reverse!
    if @player_two.class == Bot
      @player_two.play
      @players.reverse!
    end
  end

  def hit_msg(hit)
    if hit == 0
      "#{@players[0].name} missed their attack!"
    elsif hit >= Chance::MAXIMUM_PTS
      msg = Chance.crit_msg
      "#{@players[1].name} #{msg}"
    else
      msg = Chance.hit_msg
      "#{@players[1].name} #{msg}"
    end
  end

  def heal_msg(heal)
    if heal == 0
      "#{@players[0].name} failed to heal!"
    elsif heal >= Chance::MAXIMUM_PTS
      "#{@players[0].name} RECOVERED!"
    else
      "#{@players[0].name} healed!"
    end
  end

end
