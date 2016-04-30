require_relative 'room'

# Room 7
class Kitchen < Room
  # Kitchen::DESCRIPTION
  DESCRIPTION = %q{
    This is the castle's kitchen through windows in,
    the north wall you can see a secret herb garden.
    A door leaves the kitchen to the south
  }

  MOVEMENTS = {
    north: nil,
    south: StoreRoom,
    east:  nil,
    west:  nil,
    up:    nil,
    down:  nil
  }

end
