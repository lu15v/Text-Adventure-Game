# Final Project: A Text Adventure Game
# Date: 05-May-2016
# Authors: A01020319 Fernando Gomez Herrera
#          A01371743 Luis Eduardo Ballinas Aguilar

#The ExploringState class, allows to the user: fight with a monster
#see your currents status, use magic, consume food, valid movements
#pick up treasures and so on
#
require 'json'
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
      output << "\nDANGER... THERE IS A MONSTER HERE....\n"
      output << @game.current_room_model.monster.to_s
    end

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
    when :east then method = :move
    when :west then method = :move
    when :up then method = :move
    when :down then method = :move
    end
    if method == :move
      self.send method, command
    else
      self.send method
    end
  end

  #tally provides the current stats
  def tally
    player = @game.player
    puts "Tally at present is #{player.score}"
    puts "You have killed #{player.monsters_killed} so far.." if rand > 0.5
  end

  #Allows the player to change the current state of the game to FightingState
  def fight()
    @game.state = FightingState.new @game
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

  #Displays the cost of the items and what items you already have
  def inventory
    player = @game.player
    items = @game.player.items
    weapons = items[:weapons]
    puts "Provisions & Inventory"
    if player.wealth < 0.1
      return
    end
    puts "You can buy 1- Flamming Torch ($15)"
    puts "2 - Axe ($10)"
    puts "3 - Sword ($20)"
    puts "4 - Food ($2 per unit)"
    puts "5 - Magic Amulet ($30)"
    puts "6 - Suit of Armor ($50)"
    puts "0 - To continue adventure"

    option = gets.to_i

    if items.has_key? :torch
      puts "You have the torch"
    end

    if weapons.include? :axe
      puts "Your supplies now include one axe"
    end

    if weapons.include? :sword
      puts "You should guard your sword well"
    end

    if items.has_key? :amulet
      puts "Your amulet will aid you in times of stress"
    end

    if items.has_key? :suit
      puts "You look goog in armor"
    end

    if option == 1
      player.wealth -= 15
      items[:torch] = 1
    end
    if option == 2
      player.wealth -= 10
      items[:weapons] << :axe
    end
    if option == 3
      player.wealth -= 20
      items[:weapons] << :sword
    end
    if option == 5
      player.wealth -= 30
      items[:amulet] = 1
    end
    if option == 6
      player.wealth -= 50
      items[:suit] = 1
    end

    if player.wealth < 0
      puts "You have tried to cheat me!"
      items = Hash.new
      player.food = (player.food / 4).to_i
    end

    if option != 4
      if player.wealth >0
        puts "You have $#{player.wealth}"
      end
      if player.wealth == 0
        puts "You have no money"
      end
    else
      loop do
        puts "How many units of food "
        quantity = gets.to_i
        if quantity * 2 > player.wealth
          puts "You haven't got enough money"
        end
        if quantity * 2 <= player.wealth
          player.food += quantity
          player.wealth -= 2 * quantity
          break
        end
      end
    end
  end
end
