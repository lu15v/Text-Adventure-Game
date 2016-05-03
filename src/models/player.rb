class Player
  attr_accessible :strength, :wealth, :food, :tally, :monsters_killed, :items

  def initialize
    @strength        = 60 + rand(1..100) # LINE 2620
    @wealth          = 30 + rand(1..100)
    @food            = 0
    @tally           = 0
    @monsters_killed = 0
    @items           = []
  end
end
