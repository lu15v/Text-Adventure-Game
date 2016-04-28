require_relative 'room'

# Room 1
class Hallway < Room
  # Hallway::DESCRIPTION
  DESCRIPTION = %q{
    You are in the hallway
    From the dust on the ground you can tell
    no-one has walked here for a long, long time.
    There is a door to the south, through windows
    to the north you can see a secret herb garden.
  }


  TREASURE = %q{ }

  MONSTER = %q{ }

  MOVEMENTS = %q{ }


end

puts Hallway.description
