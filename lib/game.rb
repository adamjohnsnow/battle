require 'pry'

class Game
  attr_reader :player_one, :player_two, :current_turn

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @current_turn = @player_one
  end

  def attack
    switch_turns
    @current_turn.take_damage
  end

  def switch_turns
    if @current_turn == @player_one
      @current_turn = @player_two
    else
      @current_turn = @player_one
    end
  end

end
