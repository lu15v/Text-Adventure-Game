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

game = Game.new Player.new "parzival"

binding.pry

puts "DONE"
