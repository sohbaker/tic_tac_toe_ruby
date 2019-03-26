# require "display_double"
require "display"
require "board"
require "player"

class GameDouble
  attr_reader :current_player, :board

  def initialize(board)
    @board = Board.new(board)
    @player = Player.new
    @current_player = @player.player1
    @display = Display.new(self)
  end

  def welcome_message
    @display.greet_players
  end

  def play_game
    while !is_over?
      show_board
      make_move(move)
      if !has_player_won?(@current_player)
        toggle_player
      end
    end
    show_end_of_game_message
  end

  def show_board
    puts @board.board
  end

  def move
    @display.get_move(@board)
  end

  def make_move(position)
    @board.mark_board(position, @current_player)
  end

  def has_player_won?(mark)
    @board.current_player_wins?(@current_player)
  end

  def toggle_player
    if @current_player == @player.player1
      @current_player = @player.player2
    else
      @current_player = @player.player1
    end
  end

  def is_over?
    is_a_tie? || has_player_won?(@current_player)
  end

  def is_a_tie?
    @board.is_full? && !has_player_won?(@current_player)
  end

  def show_end_of_game_message
    show_board
    if is_a_tie?
      puts "\n#{@display.announce_tie}"
    else
      puts "\n#{@current_player} #{@display.announce_win}"
    end
  end
end
