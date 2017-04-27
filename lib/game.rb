require 'pry'

class Game
  attr_reader :player_one, :player_two, :current_turn, :game_state

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @current_turn = @player_one
    @game_state = "#{@current_turn.name}\'s turn!"
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
