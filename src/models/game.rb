require_relative 'rooms/entrance.rb'

class Game
  attr_accessor :player, :current_room, :state

  def initialize(player)
    @player = player
    @current_room = Entrance
    @state = ExploringState
  end

  def to_s
    "Player: #{player.name} \nCurrent Room: #{@current_room} \nState: #{@state}"
  end
end
