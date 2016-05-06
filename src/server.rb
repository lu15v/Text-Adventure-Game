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
  session[:game] = Game.new Player.new params[:player_name]
  redirect '/console'
end

get '/status' do
  get_status
end

def get_status
  game = session[:game]
  status = Hash.new
  status[:player] = game.player.name
  status[:output] = game.state.status
  puts "STATUS"
  puts status
  status.to_json
end

post '/send_command' do
  status = Hash.new

  game = session[:game]
  command = params[:command].to_sym
  puts "EXECUTING COMMAND: #{command}"
  puts "HADNLE RESULT"
  output = game.state.handle command
  puts output
  status[:output] = output
  session[:game] = game

  status.to_json
end
