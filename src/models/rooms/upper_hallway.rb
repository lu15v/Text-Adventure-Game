require_relative 'room'

# Room 15
class UpperHallway < Room
  # UpperHallway::DESCRIPTION
  DESCRIPTION = %q{
    This is the l-Shapped upper hallway.
    To the north is a door, and there is a
    stairwell in the hall as well. You can see
    the lake through the south windows.
  }
#missing stairwell movement
  MOVEMENTS = {
    north: MasterBedroom,
    south: nil,
    east:  nil,
    west:  nil,
    up:    nil,
    down:  InnerHallway
  }
end
