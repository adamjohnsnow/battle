# manages player journey through game

require 'sinatra/base'
require './lib/player_model'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions
  set :session_secret, ''

  get '/' do
    erb(:index)
  end

  post '/names' do
    $player_one = Player.new(params[:player_1])
    $player_two = Player.new(params[:player_2])
    redirect '/play'
  end

  get '/play' do
    @player_one = $player_one
    @player_two = $player_two
    erb(:play)
  end

  post '/attack' do

    redirect '/play'
  end
end
