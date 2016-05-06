# Final Project: A Text Adventure Game
# Date: 05-May-2016
# Authors: A01020319 Fernando Gomez Herrera
#          A01371743 Luis Eduardo Ballinas Aguilar

#The ExploringState class, allows to the user: fight with a monster
#see your currents status, use magic, consume food, valid movements
#pick up treasures and so on
#
require_relative 'fighting_state'

class ExploringState
  def initialize(game)
    @game = game
  end

  # Returns the current status of the state. This includes:
  # - Player status
  # - Room description
  # - Room's treasure
  # - Room's monster
  def status
    output = StringIO.new
    output << @game.player.to_s
    output << "\n"

    output << "#{@game.current_room_model.description}\n"

    treasure = @game.current_room_model.treasure
    output << "\nThere is treasure here worth $#{treasure}.\n" if treasure && treasure > 0

    monster = @game.current_room_model.monster
    if monster
      output << "\nDANGER... THERE IS A MONSTER HERE....\n\n"
      output << "#{@game.current_room_model.monster}\n\n"
    end

    output << "\nWhat do you want to do? "

    output.string
  end

  # Handles a command for this state.
  # +command+ must be a symbol
  # Possible commands:
  # - :north : Moves you to north
  # - :south : Moves you to south
  # - :east : Moves you to east
  # - :west : Moves you to west
  # - :up : Moves you to up
  # - :down : Moves you to down
  # - :tally : Shows you the current score and number of monsters killed
  # - :run : Tries to run from the current room
  # - :magic : Uses the player's Amulet to randomly move to another room
  # - :pick_up : Picks the room's treasure if there is any
  # - :fight : Fights with the monster in the room
  # - :consume : Eats food to gain strength
  def handle(command)
    puts "Doing #{command}..."
    method = command
    case command
    when :north then method = :move
    when :south then method = :move
    when :east  then method = :move
    when :west  then method = :move
    when :up    then method = :move
    when :down  then method = :move
    end

    output = ""
    if method == :move
      output << self.send(method, command)
    else
      output << self.send(method)
    end

    output << "\n"
    output << self.status

    output
  end

  # Returns the current player's score
  def tally
    player = @game.player
    output = ""
    output << "Tally at present is #{player.score}\n"
    output << "You have killed #{player.monsters_killed} monsters so far...\n" if rand > 0.5

    puts output

    output
  end

  #Allows the player to change the current state of the game to FightingState
  def fight
    monster = @game.current_room_model.monster
    player = @game.player
    return unless monster

    @game.state = FightingState.new @game

    if not player.weapons.empty?
      @game.state.status # Ask for weapon
    else
      @game.state.handle( nil ) # Start the fight directly
    end
  end

  # Moves the player to a random room using the amulet
  def magic
    room = Room.random
    return self.magic if room.name == "Entrance" || room.name == "Exit"
    @game.current_room = room.name

    "You moved to another room...\n"
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
    monster = @game.current_room_model.monster

    if direction == :north and not movements.north
      return "No exit that way"
    elsif direction == :south and not movements.south
      return "There is no exit south"
    elsif direction == :east and not movements.east
      return "You cannot go in that direction"
    elsif direction == :west and not movements.west
      return "You cannot move through solid stone"
    elsif direction == :up and not movements.up
      return "You cannot go up this floor"
    elsif direction == :down and not movements.down
      return "You cannot go down this floor"
    end

    return "Monster shouts: YOU SHALL NOT PASS!!" if monster && rand < 0.1

    @game.current_room = movements.send(direction)
    @game.player.tally += 1
    @game.player.strength -= 5

    if @game.player.strength < 1
      @game.state = DeadState.new @game
    else
      @game.state = WinnerState.new(@game) if @game.current_room == "Exit"
    end

    "You moved to another room..."
  end

  #Allows the user the probability to scape from a fight
  def run
    if rand > 0.7
      puts "No, you must stand and fight"
      game.state = FightingState.new game
      game.state.handle
    else
      puts "Which way do you want to flee?"
      move_to = gets
      move move_to
    end
  end

  # Allows the player to eat food
  def consume
    eated_food = 0;
    player = @game.player
    puts "you have #{player.food} Units of food"

    loop do
      puts "What do you Want to eat?"
      eated_food = gets.to_i

      break if eated_food <= player.food && eated_food >= 0
    end

    player.food -= eated_food
    player.strength = (player.strength + 5 * eated_food).to_i
  end

  # Transitions to the buying state
  def inventory
    @game.state = BuyingState.new @game

    @game.state.handle
  end
end
