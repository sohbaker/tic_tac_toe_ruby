class Computer
  attr_reader :mark

  def initialize(mark, board)
    @mark = mark
    @board = board
  end

  def get_move
    return winning_move if winning_move != nil
    return block_opponent if block_opponent != nil
    @board.available_moves.sample 
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
    opponent = @board.get_opponent_mark(@mark)

    @board.available_moves.each do |space|
      @board.mark_board(space, opponent)
      if @board.player_wins?(opponent)
        best_play = space
      end
      @board.clear_mark(space)
    end
 
    best_play
  end
end
