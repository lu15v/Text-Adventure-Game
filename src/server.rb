require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require "sinatra/reloader" if development?
require 'json'

require 'sequel'

DB = Sequel.connect("sqlite://game.db") # in memory

require_relative 'models/game'
require_relative 'models/player'
require_relative 'models/monster'
require_relative 'models/room'
require_relative 'models/movement'
require_relative 'models/states/fighting_state'


enable :sessions
set :bind, '0.0.0.0'
set :session_secret, 'SecretString#!$%'

get '/' do
  erb :index
end

get '/console' do
  session[:game] ||= Game.new Player.new "parzival"
  erb :console
end

post '/' do
  session[:playerN] = params[:playerN].empty? &&  'PlayerOne' || params[:playerN]
  redirect '/game'
end

get '/status' do
  game = session[:game]
  status = Hash.new
  status[:player] = game.player.name
  status[:info] = game.state.status
  status.to_json
end


get '/game' do
  @playerN = session[:playerN]
  erb :game
end
