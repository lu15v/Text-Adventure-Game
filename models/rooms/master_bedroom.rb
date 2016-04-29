require_relative 'room'
# Room 14
class MasterBedroom < Room
  # MasterBedroom::DESCRIPTION
  DESCRIPTION = %q{
    You are in the master bedroom on the upper level
    of the castle....
    Looking down from the window to the west you can see
    the entrance to the castle, while the secret herb garden
    is visible below the north window. There are doors to the
    east and to the south...
  }

  MOVEMENTS = {
    north: NULL
    south: UpperHallway
    east: Chambermaids
    west: NULL
    up: NULL
    down: NULL
  }
end
