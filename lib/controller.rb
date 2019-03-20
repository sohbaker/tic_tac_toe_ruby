require "game"

class Controller
  def initialize(board)
    @game = Game.new(board)
  end

  def greet_players
    print "Welcome to Tic Tac Toe"
    print "\nTo make a move enter the number of the position you want to play"
    print "\nPlayer1's mark is 'X' and Player2's mark is 'O'"
    print "\nThe game will end either when a player wins by placing their mark across a row, column or diagonally, or all the positions are taken"
  end

  def play_turns_until_game_is_over
    while !@game.is_over?
      print "#{@game.show_board}\nPlayer #{@game.current_player}, make a move: "
      position = $stdin.gets.chomp.to_i
      if @game.make_move(position)
        toggle_player
      else
        print "invalid move"
      end
    end
  end

  def toggle_player
    if @game.is_over?
      end_of_game
    else
      @game.switch_player
    end
  end

  def end_of_game
    if @game.is_a_tie?
      return @game.is_a_tie?
    elsif @game.has_player_won?(@game.current_player)
      return @game.has_player_won?(@game.current_player)
    end
    exit(0)
  end
end

controller = Controller.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
controller.greet_players
controller.play_turns_until_game_is_over
