# Room 10
class RearVestibule < Room
  DESCRIPTION = %q{
    You are in the rear vestibule, there are windows
    to the South from which you can see the ornamental lake.
    There is an exit to the East, and one to the North.
  }


  MOVEMENTS = {
    north: StoreRoom
    south: NULL
    east: Lift
    west: NULL
    up: NULL
    down: NULL
  }
end
