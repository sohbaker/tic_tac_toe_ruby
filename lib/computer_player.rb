require "pseudo_moves"

class ComputerPlayer
  def initialize
    @moves = PseudoMoves::COMPUTER_PLAYER
  end

  def get_move
    move = @moves.shift
    move
  end
end
