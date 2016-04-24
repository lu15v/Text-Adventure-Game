require 'sinatra'


set :bind, '0.0.0.0'
enable :sessions
set :session_secret, 'SecretString#!$%'


get '/' do
  erb :index
end

post '/' do
  session[:playerN] = params[:playerN] || "Player_one"
  redirect '/game'
end


get '/game' do
  @playerN = session[:playerN]
  erb :game
end
