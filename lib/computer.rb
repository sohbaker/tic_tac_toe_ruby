require "./spec/pseudo_moves"

class Computer
  attr_reader :mark

  def initialize(mark)
    @moves = PseudoMoves::COMPUTER_PLAYER
    @mark = mark
  end

  def get_move
    move = @moves.shift
    move
  end
end
