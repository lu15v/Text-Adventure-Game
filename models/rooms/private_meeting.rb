require_relative 'room'

# Room 4
class PrivateMeeting < Room
  # PrivateMeeting::DESCRIPTION
  DESCRIPTION = %q{
    This is the monarch's private meeting room.
    There is a single exit to the south
  }

  MOVEMENTS = {
    north: nil,
    south: InnerHallway,
    east:  nil,
    west:  nil,
    up:    nil,
    down:  nil
  }

end
