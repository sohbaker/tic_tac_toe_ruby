require "board"
require "player"

class Game
  def initialize(board, display)
    @board = Board.new(board)
    @player = Player.new
    @current_player = @player.player1 # need to change this?
    @display = display
  end

  def play_game
    greet_players
    while !is_over?
      show_board
      make_move(move)
      if !has_player_won?(@current_player)
        toggle_player
      end
    end
    show_end_of_game_message
  end

  def greet_players
    puts "Welcome to Tic Tac Toe"
    puts "To make a move enter the number of the position you want to play"
    puts "Player1's mark is 'X' and Player2's mark is 'O'"
    puts "The game will end either when a player wins by placing their mark across a row, column or diagonally, or all the positions are taken\n"
  end

  def show_board
    @board.board
  end

  def prompt_player
    print "\nPlayer #{@current_player}, make a move: "
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
      puts @display.announce_tie
    else
      puts "#{@current_player} #{@display.announce_win}"
    end
  end
end
