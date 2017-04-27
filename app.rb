# manages player journey through game

require 'sinatra/base'
require './lib/player_model'
require './lib/game'
require 'pry'

class Battle < Sinatra::Base
  get '/' do
    erb(:index)
  end

  post '/names' do
    $game = Game.new(Player.new(params[:player_1]), Player.new(params[:player_2]))
    redirect '/play'
  end

  get '/play' do
    @player_one = $game.player_one
    @player_two = $game.player_two
    erb(:play)
  end

  post '/attack' do
    $game.attack($game.player_two)
    redirect '/play'
  end
end
