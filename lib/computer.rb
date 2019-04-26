class Computer
  attr_reader :mark

  def initialize(mark, board)
    @mark = mark
    @board = board
  end

  def get_move
    sleep 0.5
    return winning_move if winning_move 
    return block_opponent if block_opponent 
    @board.available_moves.sample 
  end
 
  def winning_move
    best_play = false
    best_play = player_can_win_with_this_move(mark) if player_can_win_with_this_move(mark) 
    best_play
  end

  def block_opponent
    best_play = false   
    opponent = @board.get_opponent_mark(@mark)
    best_play = player_can_win_with_this_move(opponent) if player_can_win_with_this_move(opponent) 
    best_play
  end
  
  def player_can_win_with_this_move(mark)
    can_win = false

    @board.available_moves.each do |move|
      @board.mark_board(move, mark)
      if @board.player_wins?(mark)
        can_win = move
      end
      @board.clear_mark(move)
    end
    can_win 
  end

end
