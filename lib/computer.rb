class Computer
  attr_reader :mark, :opponent

  def initialize(mark, board)
    @mark = mark
    @board = board
  end

  def get_move
    analyse_board
  end

  def opponent_mark
    if @mark == "O"
      opponent = "X"
    else 
      opponent = "O"
    end
    opponent
  end

  def analyse_board 
    current_board = @board.board_array
    best_play = nil 

    @board.available_moves.each do |space|
      @board.mark_board(space, @mark)
      unless @board.current_player_wins?(@mark) 
        @board.clear_mark(space)
      else
        best_play = space
        # p "player win- #{best_play}"
        @board.clear_mark(space)
      end
      @board.mark_board(space, opponent_mark)
      unless @board.current_player_wins?(opponent_mark)
        @board.clear_mark(space)
      else
        best_play = space
        # p "opponent wins - #{best_play}"
        @board.clear_mark(space)
      end
   end
 
     # p "this is best - #{best_play}"
    if best_play
      return best_play
    else 
      @board.available_moves.sample
    end
  end
end
