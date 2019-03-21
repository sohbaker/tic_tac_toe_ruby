require "game"

class Controller
  def initialize(board, display)
    @game = Game.new(board)
    @display = display
  end

  def greet_players
    print "Welcome to Tic Tac Toe"
    print "\nTo make a move enter the number of the position you want to play"
    print "\nPlayer1's mark is 'X' and Player2's mark is 'O'"
    print "\nThe game will end either when a player wins by placing their mark across a row, column or diagonally, or all the positions are taken\n"
  end

  def play_turn
    move = @display.get_move
    @game.make_move(move)
  end

  def evaluate_turn
    if !@game.is_over?
      toggle_player
    end
  end

  def play_game
    while !@game.is_over?
      print "#{@game.show_board}\n\nPlayer #{@game.current_player}, make a move: "
      play_turn
      evaluate_turn
      # toggle_player
    end
    show_end_of_game_message
  end

  def toggle_player
    @game.switch_player
  end

  def show_end_of_game_message
    if @game.is_a_tie?
      @display.announce_tie
    else
      "#{@game.current_player}" + " #{@display.announce_win}"
    end
  end
end
