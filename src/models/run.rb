#!/usr/bin/env ruby -I .
require 'sequel'
DB = Sequel.connect("sqlite://game.db") # in memory

require_relative 'monster'
require_relative 'room'
require_relative 'movement'

Room.create(name: "Entrance",
            description: "Entrance room",
            treasure: 100)
Room.create(name: "Hallway",
            description: "Hallway room")
Movement.create(room_name: "Entrance",
                east: "Hallway")
Movement.create(room_name: "Hallway",
                west: "Entrance")
