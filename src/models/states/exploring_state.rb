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

  # Pick-up the treasure in the room if there is any
  def pick_up
    treasure = @game.current_room_model.treasure
    has_torch = @game.player.has_torch?
    return puts "There is no treasure to pick up" unless treasure && treasure > 0
    return puts "You cannot see where it is" unless has_torch

    @game.player.wealth += treasure

    return puts "You picked-up gems worth $#{treasure}"

    # TODO: update room status
  end
end
