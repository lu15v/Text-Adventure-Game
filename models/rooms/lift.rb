require_relative 'room'
# Room 9
class Lift < Room
  DESCRIPTION = %q{
    You have entered the lift...
    It slowly descends...
  }
  # LINE 1600 ???


  MOVEMENTS = {
    north: NULL
    south: RearVestibule
    east: NULL
    west: NULL
    up: NULL
    down: NULL
  }
end
