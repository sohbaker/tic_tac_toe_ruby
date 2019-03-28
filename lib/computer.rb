require "pseudo_moves"
require "board"

class Computer
  attr_reader :mark

  def initialize(mark)
    @moves = PseudoMoves::COMPUTER_PLAYER
    @mark = mark.upcase
  end

  def get_move
    move = @moves.shift
    move
  end
end
