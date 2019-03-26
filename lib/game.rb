require "board"
require "player"
require "display"

class Game
  attr_reader :current_player, :board

  def initialize(board)
    @board = Board.new(board)
    @player = Player.new
    @current_player = @player.player1 #needed?
    @display = Display.new(self)
  end

  def welcome_instructions
    @display.greet_players
    @display.show_rules
  end

  def play_game
    until is_over? # check out `until`
      show_board
      make_move(move)
      if !has_player_won?(@current_player)
        toggle_player
      end
    end
    show_board
  end

  def show_board
    puts @board.board # reconsider not exposing the underlying data to the world
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
    # should this class ever call puts? keeping all the IO in one class so if anything changes it only needs to change in one place
    if is_a_tie?
      puts "\n#{@display.announce_tie}"
    else
      puts "\n#{@current_player}#{@display.announce_win}"
    end
  end
end
