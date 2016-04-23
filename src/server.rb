require 'sinatra'



set :bind, '0.0.0.0'
enable :sessions
set :session_secret, 'SecretString#!$%'


get '/' do
  erb :index
end


post '/' do
  redirect '/game'
end
