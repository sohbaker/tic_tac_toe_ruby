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
    random_move
  end
 
  def winning_move
    move = false
    move = player_can_win_with_this_move(mark) if player_can_win_with_this_move(mark) 
    move
  end

  def block_opponent
    move = false   
    opponent = @board.get_opponent_mark(@mark)
    move = player_can_win_with_this_move(opponent) if player_can_win_with_this_move(opponent) 
    move
  end
  
  def player_can_win_with_this_move(mark)
    can_win = false
    @board.available_moves.each do |move|
      @board.mark_board(move, mark)
      can_win = move if @board.player_wins?(mark)
      @board.clear_mark(move)
    end
    can_win 
  end

  def random_move
    @board.available_moves.sample 
  end
end
