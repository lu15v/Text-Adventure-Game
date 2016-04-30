require_relative 'room'
# Room 9
class Lift < Room
  DESCRIPTION = %q{
    You have entered the lift...
    It slowly descends...
  }
  # LINE 1600 ???


  MOVEMENTS = {
    north: nil,
    south: RearVestibule,
    east:  nil,
    west:  nil,
    up:    nil,
    down:  nil
  }
end
