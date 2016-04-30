require_relative 'room'
# Room 6
class Entrance < Room
  # Entrance::DESCRIPTION
  DESCRIPTION = %q{
    You are at the entrance to a forbidding–Looking
    stone castle. You are facing east.
  }

  MOVEMENTS = {
    north: nil,
    south: nil,
    east:  Hallway,
    west:  nil,
    up:    nil,
    down:  nil
  }
end
