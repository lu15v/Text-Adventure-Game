require_relative 'room'
# Room 19
class Room19 < Room
  # Room19::DESCRIPTION
  DESCRIPTION = %q{
    This is the small room outside the castle lift which can be
    entered by a door to the north, another door leads to the weast.
    You can see the lake through the southern windows.
  }
#missing movement to the weird room 9 (see the map)
  MOVEMENTS = {
    north: Chambermaids
    south: NULL
    east: NULL
    west: Treasury
    up: NULL
    down: NULL
  }
end
