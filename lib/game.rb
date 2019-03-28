require "board"
require "player"
require "display"
require "computer_player"

class Game
  attr_reader :current_player, :board, :display, :mark

  def initialize
    @board = Board.new(["1", "2", "3", "4", "5", "6", "7", "8", "9"])
    @player = Player.new
    @current_player = "human"
    @mark = "X"
    @display = Display.new(self)
    @computer = ComputerPlayer.new
  end

  def welcome_instructions
    @display.greet_players
    @display.show_rules
  end

  def play_game
    until over?
      @display.show_board
      take_turn(ask_for_move("human"))
      if !player_wins?(@mark)
        toggle_player
        assign_mark
      end
    end
    @display.show_board
  end

  def take_turn(move)
    if !valid?(move)
      @display.notify_invalid
      take_turn(ask_for_move(@current_player))
    else
      make_move(move)
    end
  end

  def ask_for_move(type_of_player)
    if type_of_player == "human"
      chosen_move = @display.get_move(@mark)
    elsif type_of_player == "computer"
      chosen_move = @computer.get_move
    end
    chosen_move
  end

  def valid?(move)
    @board.available_moves.include?(move)
  end

  def make_move(position)
    @board.mark_board(position, @mark)
  end

  def player_wins?(mark)
    @board.current_player_wins?(@mark)
  end

  def toggle_player
    if @current_player == "human"
      @current_player = "computer"
    else
      @current_player = "human"
    end
  end

  def assign_mark
    if @current_player == "human"
      @mark = "X"
    else
      @mark = "O"
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
