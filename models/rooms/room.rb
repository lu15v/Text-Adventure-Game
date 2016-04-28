class Room
  attr_reader :description, :treasure, :monster, :movements

  def initialize description, treasure, monster, movements
    @description = description
    @treasure = treasure
    @monster = monster
    @movements = movements
  end
end
