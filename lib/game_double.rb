# require "display_double"
require "display"
require "board"
require "player"

class GameDouble
  def initialize(board)
    @board = Board.new(board)
    @player = Player.new
    @current_player = @player.player1
    @display = Display.new(self)
  end

  def play_game
  end
end
