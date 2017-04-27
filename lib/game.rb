# understands whose turn it is

require 'pry'

class Game
  attr_reader :player_one, :player_two, :current_turn, :current_victim

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @current_turn = @player_one
    @current_victim = @player_two
  end

  def attack
    @current_victim.take_damage
  end

  def switch_turns
    if @current_turn == @player_one
      @current_turn = @player_two
      @current_victim = @player_one
    else
      @current_turn = @player_one
      @current_victim = @player_two
    end
  end

end
