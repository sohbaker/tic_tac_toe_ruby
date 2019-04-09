class Computer
  attr_reader :mark

  def initialize(mark, board)
    @mark = mark
    @board = board
  end

  def get_move
    analyse_board.sample
  end

  def analyse_board
    @board.available_moves
  end
end
