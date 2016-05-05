class Player
  attr_accessor :name, :strength, :wealth, :food, :tally, :monsters_killed, :items

  def initialize(name)
    @name            = name
    @strength        = 60 + rand(1..100) # LINE 2620
    @wealth          = 30 + rand(1..100)
    @food            = 0
    @tally           = 0
    @monsters_killed = 0
    @items           = []
  end

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
