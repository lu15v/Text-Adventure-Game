class WinnerState

  def initialize(game)
    @game = game
  end

  def handle
    output = ""
    player = @game.player
    output << "You won!! you have scaped with life from the castle!!! "
    output << "WELL DONE!!"
    output << "Your final score is => #{player.score}\n"
    puts output
  output
  end
end
