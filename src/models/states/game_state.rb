# Final Project: A Text Adventure Game
# Date: 05-May-2016
# Authors: A01020319 Fernando Gomez Herrera
#          A01371743 Luis Eduardo Ballinas Aguilar

#GameState class, provides the state of the game
class GameState
  attr_reader :game

  def initialize(game)
    @game = game
  end
end
