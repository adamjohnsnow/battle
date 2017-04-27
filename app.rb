require 'sinatra/base'
require './lib/player_model'
require './lib/game'

# manages player journey through game

class Battle < Sinatra::Base
  get '/' do
    erb(:index)
  end

  post '/names' do
    p1 = Player.new(params[:player_1])
    p2 = Player.new(params[:player_2])
    @game = Game.start(p1, p2)
    redirect '/play'
  end

  get '/play' do
    @game = Game.instance
    erb(:play)
  end

  post '/attack' do
    Game.instance.attack
    if Game.instance.players[0].hp <= 0 || Game.instance.players[1].hp <= 0
      redirect '/win'
    else
      redirect '/hit'
    end
  end

  get '/hit' do
    @game = Game.instance
    erb(:confirm)
  end

  post '/next' do
    Game.instance.switch_turns
    redirect '/play'
  end

  get '/win' do
    @winner = Game.instance.players[0].name
    erb(:win)
  end
end
