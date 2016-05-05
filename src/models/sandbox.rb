#!/usr/bin/env ruby -I .
require 'rubygems'
require 'bundler/setup'

require 'sequel'
require 'byebug'
DB = Sequel.connect("sqlite://game.db") # in memory

require_relative 'game'
require_relative 'player'
require_relative 'monster'
require_relative 'room'
require_relative 'movement'


binding.pry

puts "DONE"
