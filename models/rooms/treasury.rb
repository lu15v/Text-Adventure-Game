require_relative 'room'
# Room 16
class Treasury < Room
  # Treasury::DESCRIPTION
  DESCRIPTION = %q{
    This room was used as the castle treasury in by-gone years...
    There are no windows, just exits to the north and to the east.
  }

  MOVEMENTS = {
    north: Chambermaids
    south: NULL
    east: Room19
    west: NULL
    up: NULL
    down: NULL
  }
end
