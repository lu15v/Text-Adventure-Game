require_relative 'room'
# Room 12
class Dungeon < Room
  # Dungeon::DESCRIPTION
  DESCRIPTION = %q{
    You are in the dank, dark dungeon there is a single exit, a
    small hole in wall towards the west.
  }
#Missing stairwell movement
  MOVEMENTS = {
    north: nil,
    south: nil,
    east:  nil,
    west:  Guardroom,
    up:    nil,
    down:  nil
  }
end
