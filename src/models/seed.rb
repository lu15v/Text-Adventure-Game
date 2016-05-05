require 'csv'
require 'sequel'
DB = Sequel.connect("sqlite://game.db") # in memory

require_relative 'monster'
require_relative 'room'
require_relative 'movement'


# Clean
Room.dataset.delete
Movement.dataset.delete

rooms = CSV.read("rooms.csv")
rooms.shift
movements = CSV.read("movements.csv")
movements.shift
rooms.each do |r|
  puts "Creating rooms..."
  p r
  Room.create(name:        r[0],
              description: r[1],
              monster:     r[2],
              treasure:    r[3])
end
puts "#{rooms.length} rooms created."
movements.each do |r|
  puts "Creating movements..."
  Movement.create(room_name: r[0],
                  north:     r[1],
                  south:     r[2],
                  east:      r[3],
                  west:      r[4],
                  up:        r[5],
                  down:      r[6])
end
puts "#{movements.length} movements created."
