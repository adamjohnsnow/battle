require 'sinatra/base'
require './lib/player_model'
require './lib/game'
require './lib/bot'
require './lib/chance'
require 'bootstrap'
require "pry"

# manages player journey through game

class Battle < Sinatra::Base
  get '/' do
    erb(:index)
  end

  post '/names' do
    p1 = Player.new(params[:player_1])
    params[:player_2] == '' ? p2 = Bot.new : p2 = Player.new(params[:player_2])
    @game = Game.start(p1, p2)
    redirect '/play'
  end

  get '/play' do
    @game = Game.instance
    redirect '/win' if end_game?
    erb(:play)
  end

  post '/attack' do
    Game.instance.attack
    Game.instance.switch_turns
    redirect '/confirm' if Game.instance.player_two.class == Bot
    redirect '/play'
  end

  post '/heal' do
    Game.instance.heal
    Game.instance.switch_turns
    redirect '/play'
  end

  get '/confirm' do
    @game = Game.instance
    erb(:confirm)
  end

  get '/win' do
    @winner = Game.instance.players[1].name
    erb(:win)
  end

  post '/new' do
    redirect '/'
  end

  def single_player?

  end

  def end_game?
    Game.instance.players[0].hp <= 0 || Game.instance.players[1].hp <= 0
  end
end
