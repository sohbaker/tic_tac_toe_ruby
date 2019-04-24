class Computer
  attr_reader :mark

  def initialize(mark, board)
    @mark = mark
    @board = board
  end

  def get_move
    return winning_move if winning_move 
    return block_opponent if block_opponent 
    @board.available_moves.sample 
  end
 
  def winning_move
    best_play = false

    @board.available_moves.each do |move|
      @board.mark_board(move, @mark)
      if @board.player_wins?(@mark) 
        best_play = move
      end
      @board.clear_mark(move)
    end

    best_play
  end

  def block_opponent
    best_play = false 
    opponent = @board.get_opponent_mark(@mark)

    @board.available_moves.each do |move|
      @board.mark_board(move, opponent)
      if @board.player_wins?(opponent)
        best_play = move
      end
      @board.clear_mark(move)
    end
 
    best_play
  end
end
