class Computer
  attr_reader :mark

  def initialize(mark, board, display)
    @mark = mark
    @board = board
    @display = display
  end

  def get_move
    pause_before_taking_turn
    return winning_move if winning_move 
    return block_opponent if block_opponent 
    random_move
  end
 
  def pause_before_taking_turn
    @display.pause_message
    sleep 0.5
  end

  def winning_move
    move = false
    move = player_winning_move(mark) if player_winning_move(mark) 
    move
  end

  def block_opponent
    move = false   
    opponent = @board.get_opponent_mark(@mark)
    move = player_winning_move(opponent) if player_winning_move(opponent) 
    move
  end
  
  def player_winning_move(mark)
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
