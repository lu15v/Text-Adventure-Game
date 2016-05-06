require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require "sinatra/reloader" if development?
require 'json'

require 'sequel'

DB ||= Sequel.connect("sqlite://game.db") # in memory

DEPENDENCIES ||= ['models/game', 'models/player', 'models/monster', 'models/room',
                'models/movement', 'models/states/fighting_state',
                'models/states/exploring_state']
DEPENDENCIES.each { |file| also_reload file } if development?
DEPENDENCIES.each { |file| require_relative file }

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
  get_status.to_json
end

def get_status
  game = session[:game]
  status = Hash.new
  status[:player] = game.player.name
  status[:weapons]  = game.player.weapons.to_a
  status[:monster] = game.current_room_model.monster != nil
  status[:output] = game.state.status
  status[:state] = game.state.class.to_s
  puts "STATUS"
  puts status

  status
end

post '/send_command' do
  status = Hash.new

  puts "PARAMS"
  p params

  game = session[:game]
  command = params[:command].to_sym
  puts "EXECUTING COMMAND: #{command}"
  output = game.state.handle command
  puts output
  status = get_status
  status[:output] = output

  status.to_json
end

post '/fight' do
  status = get_status

  puts "PARAMS"
  p params

  game = session[:game]
  weapon = params[:weapon].to_sym
  puts "FIGHTING WITH WEAPON: #{weapon}"
  output = game.state.handle weapon
  puts output
  status = get_status
  status[:output] = output

  status.to_json
end
