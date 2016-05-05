DB.create_table? :rooms do
  foreign_key :monster, :monsters

  String :name, primary_key: true
  String :description
  Integer :treasure
end
## The +Room+ class represents a room in the game
#  It contains a +description+ which is displayed when the players enters a room
#  a +treasure+ if there is any in the room
#  a +monster+ that may or not be in the rrom
#  and a +movements+ hash which has the directions in which the player can move to
class Room < Sequel::Model
  # Detailed (or not) description of the room. Common idiom is to use the +%q{}+ shorthand.
  # e.g.
  #   DESCRIPTION = %q{
  #     You are in the hallway
  #     From the dust on the ground you can tell
  #     no-one has walked here for a long, long time.
  #     There is a door to the south, through windows
  #     to the north you can see a secret herb garden.
  #   }
  #def self.description
    #self::DESCRIPTION
  #end
  # The kind of treasure if there is any in the room
  # e.g
  #   TREASURE = RubyGem
  #def self.treasure
    #self::TREASURE
  #end
  # The monster if there is any inside the room
  # e.g.
  #   MONSTER = FerociousWerewolf
  #def self.monster
    #self::MONSTER
  #end
  # Movements hash that contains the transitions from room
  # e.g.
  #   MOVEMENTS = {
  #     north: nil,
  #     south: AudienceChamber,
  #     east:  nil,
  #     west:  Entrance,
  #     up:    nil,
  #     down:  nil
  #   }
  #def self.movements
    #self::MOVEMENTS
  #end
end
Room.unrestrict_primary_key
Room.set_allowed_columns :name, :description, :monster, :treasure
