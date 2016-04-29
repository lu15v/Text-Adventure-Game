require_relative 'room'
# Room 8
class StoreRoom < Room
  DESCRIPTION = %q{
    You are in the Store Room, amidst spices,
    vegetables, and vast sacks of flour and other
    provisions. There is a door to the North and
    one to the South.
  }


  MOVEMENTS = {
    north: Kitchen
    south: RearVestibule
    east: NULL
    west: NULL
    up: NULL
    down: NULL
  }
end
