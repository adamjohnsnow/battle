require 'sinatra/base'
require './lib/player_model'
require './lib/game'
require 'pry'

# manages player journey through game

class Battle < Sinatra::Base
  get '/' do
    erb(:index)
  end

  post '/names' do
    p1 = Player.new(params[:player_1])
    p2 = Player.new(params[:player_2])
    $game = Game.new(p1, p2)
    redirect '/play'
  end

  get '/play' do
    @player_one = $game.player_one
    @player_two = $game.player_two
    @current_turn = $game.current_turn.name
    erb(:play)
  end

  post '/attack' do
    $game.attack
    if $game.player_one.hp <=0 || $game.player_two.hp <=0
      redirect '/win'
    else
      redirect '/hit'
    end
  end

  get '/hit' do
    @player_one = $game.player_one
    @player_two = $game.player_two
    @current_turn = $game.current_victim.name
    erb(:confirm)
  end

  post '/next' do
    $game.switch_turns
    redirect '/play'
  end

  get '/win' do
    @winner = $game.current_turn.name
    erb(:win)
  end

end
