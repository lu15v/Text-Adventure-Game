require_relative 'room'

# Room 2
class AudienceChamber < Room
  # Hallway::DESCRIPTION

  DESCRIPTION = %q{
    This is the audience chamber
    There is a window to the west. By looking to the right
    Through it you can see the entrance to the castle.
    Doors leave this room to the north, east and south
  }


  MOVEMENTS = %q{
    north: RoomN1
    south: RoomN3
    east: RoomN3
    west: NULL
    up: NULL
    down: NULL
  }

end
