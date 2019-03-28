require "board"
require "display"
require "computer"

class Game
  attr_reader :current_player, :board, :display, :mark

  def initialize
    @board = Board.new(["1", "2", "3", "4", "5", "6", "7", "8", "9"])
    @current_player = "human"
    @mark = "X"
    @display = Display.new(self)
    @computer = Computer.new("x")
  end

  def welcome_instructions
    @display.greet_players
    @display.show_rules
  end

  def assign_mark
    if @current_player == "human"
      @mark = "X"
    else
      @mark = "O"
    end
  end

  def play_game
    until over?
      @display.show_board
      move = ask_for_move(@current_player)
      check_move(move)
      if !player_wins?(@mark)
        toggle_player
        assign_mark
      end
    end
  end

  def ask_for_move(type_of_player)
    if type_of_player == "human"
      chosen_move = @display.get_move(@mark)
    elsif type_of_player == "computer"
      @display.prompt_player(@mark)
      chosen_move = @computer.get_move
      @display.show(chosen_move)
    end
    chosen_move
  end

  def check_move(move)
    if valid?(move)
      complete_move(move)
    else
      get_new_move
    end
  end

  def valid?(move)
    @board.available_moves.include?(move)
  end

  def get_new_move
    @display.notify_invalid
    new_move = ask_for_move(@current_player)
    check_move(new_move)
  end

  def complete_move(position)
    @board.mark_board(position, @mark)
  end

  def player_wins?(mark)
    @board.current_player_wins?(mark)
  end

  def toggle_player
    if @current_player == "human"
      @current_player = "computer"
    else
      @current_player = "human"
    end
  end

  def over?
    is_a_tie? || player_wins?(@current_player)
  end

  def is_a_tie?
    @board.full? && !player_wins?(@current_player)
  end

  def show_end_of_game_message
    @display.show_board
    if is_a_tie?
      @display.announce_tie
    else
      @display.announce_win(@mark)
    end
  end
end
