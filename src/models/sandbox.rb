require 'rubygems'
require 'bundler/setup'

require 'sequel'
require 'pry'
require 'byebug'
DB = Sequel.connect("sqlite://game.db") # in memory

require_relative 'game'
require_relative 'player'
require_relative 'monster'
require_relative 'room'
require_relative 'movement'
require_relative 'states/fighting_state'

game = Game.new Player.new "parzival"
game.state = FightingState.new game

binding.pry

puts "DONE"
