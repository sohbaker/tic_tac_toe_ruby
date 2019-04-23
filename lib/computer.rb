class Computer
  attr_reader :mark, :opponent

  def initialize(mark, board)
    @mark = mark
    @board = board
  end

  def get_move
    return winning_move if winning_move != nil
    return block_opponent if block_opponent != nil
    @board.available_moves.sample 
  end
 
  def opponent_mark
    if @mark == "X"
      "O"
    else 
      "X"
    end
  end

  def winning_move
  best_play = nil 

   @board.available_moves.each do |space|
    @board.mark_board(space, @mark)
      if @board.player_wins?(@mark) 
        best_play = space
      end
    @board.clear_mark(space)
    end

    best_play
  end

  def block_opponent
  best_play = nil 
  
  @board.available_moves.each do |space|
    @board.mark_board(space, opponent_mark)
    if @board.player_wins?(opponent_mark)
      best_play = space
    end
    @board.clear_mark(space)
  end
 
  best_play
  end
end
