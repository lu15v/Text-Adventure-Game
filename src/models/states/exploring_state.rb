class ExploringState
  def initialize(game)
    @game = game
  end

  def tally
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

  # Move from one room to another
  def move(direction)
    movements = @game.current_room_model.movement
    if direction == :north and not movements.north
      return puts "No exit that way"
    elsif direction == :south and not movements.south
      return puts "There is no exit south"
    elsif direction == :east and not movements.east
      return puts "You cannot go in that direction"
    elsif direction == :west and not movements.west
      return puts "You cannot move through solid stone"
    elsif direction == :up and not movements.up
      return puts "You cannot go up this floor"
    elsif direction == :down and not movements.down
      return puts "You cannot go down this floor"
    end

    @game.current_room = movements.send(direction)
    @game.player.tally += 1
    @game.player.strength -= 5

    if @game.player.strength < 1
      @game.state = DeadState.new @game
    else
      @game.state = WinnerState.new(@game) if @game.current_room == "Exit"
    end
  end
end
