class Game
  attr_reader :current_player, :board, :display, :player_1, :player_2, :mark
  
  def initialize(board, display, *players)
    @board = board
    @display = display 
    @player_1 = players.shift 
    @player_2 = players.shift 
    @current_player = @player_1
  end

  def play_game
    until over?
      @display.clear_screen
      @display.show_board(@board.grid)
      @display.prompt_player(@current_player.mark)
      move = @current_player.get_move
      validate_move(move)
      toggle_player unless player_wins?(@current_player.mark)
    end
    show_outcome    
  end

  def validate_move(move)
    board.valid?(move) ? complete_move(move, @current_player.mark) : get_new_move
  end

  def get_new_move
    @display.notify_invalid("move")
    new_move = @current_player.get_move
    validate_move(new_move)
  end

  def complete_move(position, mark)
    @board.mark_board(position, mark)
  end

  def player_wins?(mark)
    @board.player_wins?(mark)
  end

  def toggle_player
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end

  def over?
    is_a_tie? || player_wins?(@current_player.mark)
  end

  def is_a_tie?
    @board.full? && !player_wins?(@current_player.mark)
  end
  
  def show_outcome
    @display.show_outcome(@board, @current_player.mark) 
  end
end
