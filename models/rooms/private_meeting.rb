require_relative 'room'

# Room 4
class PrivateMeeting < Room
  # Hallway::DESCRIPTION
  DESCRIPTION = %q{
    This is the monarch's private meeting room.
    There is a single exit to the south
  }

  MOVEMENTS = %q{
    north: NULL
    south: Room5N
    east: NULL
    west: NULL
    up: NULL
    down: NULL
  }

end
