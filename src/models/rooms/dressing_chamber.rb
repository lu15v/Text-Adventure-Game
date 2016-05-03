require_relative 'room'
# Room 18
class DressingChamber < Room
  # DressingChamber::DESCRIPTION
  DESCRIPTION = %q{
    This is tiny room on the upper leve is the dressing chamber.
    There is a window to the north, a view of the herb garden down
    below. A door leaves to the south.
  }

  MOVEMENTS = {
    north: nil,
    south: Chambermaids,
    east:  nil,
    west:  nil,
    up:    nil,
    down:  nil
  }
end
