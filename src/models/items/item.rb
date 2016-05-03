# Warewolves and Wanderers Game
# Date: 20-Apr-2016

## The +Item+ class represents a object that the player can buy
#  and use while playing the game.
class Item
  # Returns the name of the item
  def self.name
    self::NAME
  end

  # Returns the cost of the item
  def self.cost
    self::COST
  end

  # String representation of the item in the format NAME ($COST)
  def to_s
    "#{NAME} ($#{COST})"
  end
end
