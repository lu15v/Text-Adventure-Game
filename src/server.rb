require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require "sinatra/reloader" if development?

enable :sessions
set :bind, '0.0.0.0'
set :session_secret, 'SecretString#!$%'

get '/' do
  erb :index
end

get '/console' do
  erb :console
end

post '/' do
  session[:playerN] = params[:playerN].empty? &&  'PlayerOne' || params[:playerN]
  redirect '/game'
end


get '/game' do
  @playerN = session[:playerN]
  erb :game
end
