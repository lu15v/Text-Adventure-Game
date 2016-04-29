# Room 6
class Entrance < Room
  # Hallway::DESCRIPTION
  DESCRIPTION = %q{
    You are at the entrance to a forbidding–Looking
    stone castle. You are facing east.
  }

  MOVEMENTS = %q{
    north: NULL
    south: NULL
    east: RoomN1
    west: NULL
    up: NULL
    down: NULL
  }
end
