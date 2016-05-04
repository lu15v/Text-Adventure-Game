class ExploringState
  def initialize(game)
    @game = game
  end

  def tally()
    rnd = rand()
    player = game.player
    total = 3 * player.tally + 5 * player.strength + 2 * player.wealth + player.food + 30 * player.monsters_killed
    puts "Tally at present is #{total}"

    if rand > .5
      puts "You have killed #{player.monsters_killed} so far.."
    end

  end

  def fight()

    game.state = FightingState
    
  end


end
