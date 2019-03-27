require "board"
require "player"
require "display"

class Game
  attr_reader :current_player, :board, :display

  def initialize
    @board = Board.new(["1", "2", "3", "4", "5", "6", "7", "8", "9"])
    @player = Player.new
    @current_player = @player.player1 #needed?
    @display = Display.new(self)
  end

  def welcome_instructions
    @display.greet_players
    @display.show_rules
  end

  def play_game
    until over?
      @display.show_board
      take_turn(ask_for_move)
      if !player_wins?(@current_player)
        toggle_player
      end
    end
    @display.show_board
  end

  def take_turn(move)
    if !valid?(move)
      @display.notify_invalid
      take_turn(move())
    else
      make_move(move)
    end
  end

  def ask_for_move(type_of_player)
    # where does it get the type of player from ??
    if type_of_player == human
      chosen_move = @display.get_move(@current_player, @board)
    elsif type_of_player == computer
      chosen_move = do something else 
    end
    chosen_move 
  end

  def valid?(move)
    @board.available_moves.include?(move)
  end

  def make_move(position)
    @board.mark_board(position, @current_player)
  end

  def player_wins?(mark)
    @board.current_player_wins?(@current_player)
  end

  def toggle_player
    if @current_player == @player.player1
      @current_player = @player.player2
    else
      @current_player = @player.player1
    end
  end

  def over?
    is_a_tie? || player_wins?(@current_player)
  end

  def is_a_tie?
    @board.full? && !player_wins?(@current_player)
  end

  def show_end_of_game_message
    if is_a_tie?
      @display.announce_tie
    else
      @display.announce_win(@current_player)
    end
  end
end
