# Final Project: A Text Adventure Game
# Date: 05-May-2016
# Authors: A01020319 Fernando Gomez Herrera
#          A01371743 Luis Eduardo Ballinas Aguilar

## +BuyingState+ class.
# This state represents the context where the player is trying to buy
# something to add an item to the inventory.
class BuyingState
  def initialize(game)
    @game = game
  end

  # Returns the current status for the state, i.e. request the player to buy something
  def status
    output = ""
    output << "Provisions & Inventory\n"
    output << "You can buy 1- Flamming Torch ($15)\n"
    output << "2 - Axe ($10)\n"
    output << "3 - Sword ($20)\n"
    output << "4 - Food ($2 per unit)\n"
    output << "5 - Magic Amulet ($30)\n"
    output << "6 - Suit of Armor ($50)\n"
    output << "0 - To continue adventure\n"

    output
  end
  # Displays the cost of the items and what items you already have
  def handle(command)
    output = ""
    player = @game.player
    items = @game.player.items
    weapons = items[:weapons]

    return if player.wealth < 0.1

    option = command.to_i

    output << "You have the torch\n" if items.has_key? :torch

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
