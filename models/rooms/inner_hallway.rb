require_relative 'room'

# Room 5
class InnerHallway < room
  # InnerHallway::DESCRIPTION
  DESCRIPTION = %q{
    This inner hallway contains a door to the north,
    and one to the west, and a circular stairwell.
    Passes through the room.
    You can see an ornamental lake through the windows to the south
  }


  MOVEMENTS = {
    north: PrivateMeeting,
    south: NULL,
    east:  NULL,
    west:  GreatHall,
    up:    UpperHallway,
    down:  Guardroom
  }

end
