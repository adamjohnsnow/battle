require 'sinatra/base'


class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    session[:player_one] = params[:player_one]
    session[:player_two] = params[:player_two]
    session[:p1_hp] = 60
    session[:p2_hp] = 60
    redirect '/play'
  end

  get '/play' do
    @player_one = session[:player_one]
    @p1_hp = session[:p1_hp]
    @player_two = session[:player_two]
    @p2_hp = session[:p2_hp]
    erb(:play)
  end

end
