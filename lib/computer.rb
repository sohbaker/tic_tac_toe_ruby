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
    spaces = @board.available_moves
    current_board = @board.board_array
    best_play = nil 

    spaces.each do |space|
      @board.mark_board(space, @mark)
      if @board.current_player_wins?(@mark)
        best_play = space
        @board.board_array[space.to_i - 1] = space
      else
        @board.board_array[space.to_i - 1] = space
      end
      @board.mark_board(space, opponent_mark)
      if @board.current_player_wins?(opponent_mark)
        best_play = space
        @board.board_array[space.to_i - 1] = space
      else
        @board.board_array[space.to_i - 1] = space
      end 
     end
   
    if best_play 
      return best_play
    else
      spaces.sample
    end  
  end
end
