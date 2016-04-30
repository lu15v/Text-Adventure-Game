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
    north: NULL,
    south: NULL,
    east:  NULL,
    west:  Guardroom,
    up:    NULL,
    down:  NULL
  }
end
