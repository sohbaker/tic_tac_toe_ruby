require "board"
require "player"

class Game
  def initialize(board)
    @board = Board.new(board)
    @player = Player.new
    @current_player = @player.player1
  end

  def show_board
    @board.board
  end

  def board
    @board
  end

  def current_player
    @current_player
  end

  def make_move(position)
    if @board.is_valid_move?(position)
      @board.mark_board(position, @current_player)
      return true
    end
    false
  end

  def switch_player
    if @current_player == @player.player1
      @current_player = @player.player2
    else
      @current_player = @player.player1
    end
  end

  def has_player_won?(mark)
    @board.current_player_wins?(@current_player)
  end

  def is_a_tie?
    @board.is_full? && !has_player_won?(current_player)
  end

  def is_over?
    is_a_tie? || has_player_won?(current_player)
  end
end
