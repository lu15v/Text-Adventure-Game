require 'set'

#The Player class, provides all the variables and initial values of the player
class Player
  # Player's name
  attr_accessor :name
  # Player's strength. Initially it takes a random value between [60 160] inclusive.
  attr_accessor :strength
  # Player's wealth. Initially it takes a random value between [30 130] inclusive.
  attr_accessor :wealth
  # Players' reserve of food. Starts in zero.
  attr_accessor :food
  # Player's movement count. It counts how many times the player has moved across rooms.
  attr_accessor :tally
  # Player's monster killed counter. How many monsters the player has killed.
  attr_accessor :monsters_killed
  # Player's items in inventory. e.g.
  #   items = {
  #     food: 10,
  #     weapons: #{:axe, :sword }
  #   }
  attr_accessor :items

  # Creates a new Player with a given name
  def initialize(name)
    @name            = name
    @strength        = 60 + rand(1..100) # LINE 2620
    @wealth          = 30 + rand(1..100)
    @food            = 0
    @tally           = 0
    @monsters_killed = 0
    @items           = Hash.new
    @items[:torch]   = true
    @items[:amulet]  = true
    @items[:suit]    = true
    @items[:weapons] = Set.new [:axe, :sword]
  end

  #to String methods, provides the strength, wealth and the units of food of the player
  def to_s
    %Q{
      ---------------------------------------------------------
      Your strength is #{@strength}.
      You have $#{@wealth}.
      Your provision sack holds #{@food} units of food.
      ---------------------------------------------------------
    }
  end

  # Returns true if the player is carrying a torch in his items
  # false otherwise
  def has_torch?
    self.items.has_key? :torch
  end

  # Returns the weapons that the player is carrying as a set of symbols
  # e.g.
  #   player.weapons => #<Set: { :axe }>
  def weapons
    self.items[:weapons]
  end

  # Returns the player's score so far. It is calculated as follows:
  #   SCORE = 3*TALLY + 5*STRENGTH + 2*WEALTH + FOOD + 30*MONSTERS_KILLED
  # Notice that the number of monsters killed has more effect
  # on your final score than just about any other item.
  def score
    3*@tally + 5*@strength + 2*@wealth + @food + 30*@monsters_killed
  end
end
