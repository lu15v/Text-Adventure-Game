require 'set'

#The Player class, provides all the variables and initial values of the player
class Player
  attr_accessor :name, :strength, :wealth, :food, :tally, :monsters_killed, :items

  def initialize(name)
    @name            = name
    @strength        = 60 + rand(1..100) # LINE 2620
    @wealth          = 30 + rand(1..100)
    @food            = 0
    @tally           = 0
    @monsters_killed = 0
    #changed from array to hash for ease the access to the items
    @items           = Hash.new
    @items[:weapons] = Set.new
  end
  #example of items
  #  items = {
  #     food: 10,
  #     weapons: #{:axe, :sword }
  #  }
  #easy access to weapons, example: +items[:weapons].each+

  #to String methods, provides the strength, wealth and the units of food of the player
  def to_s
    %Q{
      Your strength is #{@strength}.
      You have $#{@wealth}.
      Your provision sack holds #{@food} units of food.
    }
  end

  # Returns true if the player is carrying a torch in his items
  # false otherwise
  def has_torch?
    self.items.has_key? :torch
  end
end
