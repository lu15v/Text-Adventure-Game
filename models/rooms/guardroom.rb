require_relative 'room'
# Room 13
class Guardroom < Room
  # Guardroom::DESCRIPTION
  DESCRIPTION = %q{
    You are in the prison guardroom, in the basement of the castle.
    The stairwell ends in this room. There is one other exit, a small
    hole in the east wall.
  }
#Missing stairwell movement
  MOVEMENTS = {
    north: nil,
    south: nil,
    east:  Dungeon,
    west:  nil,
    up:    InnerHallway,
    down:  nil
  }
end
