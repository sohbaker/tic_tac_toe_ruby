class HumanDouble
  attr_reader :mark
  
  def initialize(mark, moves)
    @mark = mark
    @moves = moves
  end
  
  def get_move
    @moves.shift
  end
end
