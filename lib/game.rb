require "board"
require "display"
require "computer"
require "human"

class Game
  attr_reader :current_player, :board, :display, :player1, :player2, :mark
  
  def initialize(board)
    @board = board
    @display = Display.new
  end

  def welcome_instructions
    @display.greet_players
    @display.show_rules
  end

  def get_game_type
    @display.choose_game_type
    type = @display.take_input
    create_players(type)
  end

  def create_players(game_type)
    if game_type == "hh"
      @player1 = Human.new("X")
      @player2 = Human.new("O")
      @current_player = @player1
    elsif game_type == "hc"
      @player1 = Human.new("X")
      @player2 = Computer.new("O", @board)
      @current_player = @player1
    else
      @display.notify_invalid("choice")
      get_game_type()
    end
  end

  def play_game
    until over?
     system('clear') 
      @display.show_board(@board.current_board)
      @display.prompt_player(@current_player.mark)
      move = @current_player.get_move
      check_move(move)
      if !player_wins?(@current_player.mark)
        toggle_player
      end
    end
  end

  def check_move(move)
    if valid?(move)
      complete_move(move, @current_player.mark)
    else
      get_new_move
    end
  end

  def valid?(move)
    @board.available_moves.include?(move)
  end

  def get_new_move
    @display.notify_invalid("move")
    new_move = @current_player.get_move
    check_move(new_move)
  end

  def complete_move(position, mark)
    @board.mark_board(position, mark)
  end

  def player_wins?(mark)
    @board.player_wins?(mark)
  end

  def toggle_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def over?
    is_a_tie? || player_wins?(@current_player.mark)
  end

  def is_a_tie?
    @board.full? && !player_wins?(@current_player.mark)
  end

  def show_outcome
    system('clear')
    @display.show_board(@board.current_board)
    if is_a_tie?
      @display.announce_tie
    else
      @display.announce_win(@current_player.mark)
    end
  end
end
