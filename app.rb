require 'sinatra/base'
require './lib/player_model'
require './lib/game'
require './lib/chance'
require 'pry'

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
    hit = Chance.roll
    miss_redirect(hit)
  end

  post '/heal' do
    health = Chance.roll
    heal_fail_redirect(health)
  end

  get '/hit' do
    @message = 'got hit!'
    @game = Game.instance
    @player = @game.players[1].name
    erb(:confirm)
  end

  get '/crit' do
    @message = 'CRITICAL HIT!'
    @game = Game.instance
    @player = @game.players[1].name
    erb(:confirm)
  end

  get '/healed' do
    @message = 'healed!'
    @game = Game.instance
    @player = @game.players[0].name
    erb(:confirm)
  end

  get '/recovered' do
    @message = 'RECOVERED!'
    @game = Game.instance
    @player = @game.players[0].name
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

  get '/missed' do
    @message = 'missed!'
    @game = Game.instance
    @player = Game.instance.players[0].name
    erb(:confirm)
  end

  private

  def miss_redirect(hit)
    redirect '/missed' if hit.zero?
    hits(hit)
  end

  def heal_fail_redirect(health)
    redirect '/missed' if health.zero?
    heals(health)
  end

  def heals(health)
    Game.instance.heal(health)
    redirect '/recovered' if health > 10
    redirect '/healed'
  end

  def hits(hit)
    Game.instance.attack(hit)
    redirect '/win' if end_game?
    redirect '/crit' if hit > 10
    redirect '/hit'
  end

  def end_game?
    Game.instance.players[0].hp <= 0 || Game.instance.players[1].hp <= 0
  end
end
