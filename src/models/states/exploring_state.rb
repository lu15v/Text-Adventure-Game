class ExploringState
  def initialize(game)
    @game = game
  end

  def tally()
    rnd = rand()
    player = game.player
    total = 3 * player.tally + 5 * player.strength + 2 * player.wealth + player.food + 30 * player.monsters_killed
    puts "Tally at present is #{total}"

    if rand > 0.5
      puts "You have killed #{player.monsters_killed} so far.."
    end

  end

  def fight()

    game.state = FightingState
    
  end


  # Moves the player to a random room using the amulet
  def magic
    room = Room.random
    return self.magic if room.name == "Entrance" || room.name == "Exit"
    @game.current_room = room.name
  end
end
