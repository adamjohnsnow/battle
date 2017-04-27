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
    @player_message = $game.game_state
    erb(:play)
  end

  post '/attack' do
    $game.attack
    redirect '/play'
  end

  post '/next' do
    redirect '/play'
  end
end
