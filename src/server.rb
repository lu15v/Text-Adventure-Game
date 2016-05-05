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
  get_status
end

def get_status
  game = session[:game]
  status = Hash.new
  status[:player] = game.player.name
  status[:info] = game.state.status
  puts "STATUS"
  puts status
  status.to_json
end

post '/send_command' do
  game = session[:game]
  command = params[:command].to_sym
  puts "EXECUTING COMMAND: #{command}"
  game.state.handle command
  get_status
end

get '/game' do
  @playerN = session[:playerN]
  erb :game
end
