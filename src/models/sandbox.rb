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

class GameIO < IO
  attr_accessor :file
  def initialize(orig, file)
    @orig = orig
    @file = file
  end
  def write string
    @file << string
    @orig.write string
  end
end

#output = GameIO.new $stdout, StringIO.new
#$stdout = output
#game = Game.new Player.new "parzival"
#game.state = ExploringState.new game
#game.state.handle
#puts "RETURNS"
#$stdout.write "DONE"

game = Game.new Player.new "parzival"
game.state = ExploringState.new game

binding.pry

puts "DONE"
