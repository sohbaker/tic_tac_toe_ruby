class Display
  def show_board(board)
    puts "" "
    #{board[0]} | #{board[1]} | #{board[2]}
    ---------
    #{board[3]} | #{board[4]} | #{board[5]}
    ---------
    #{board[6]} | #{board[7]} | #{board[8]}" ""
  end

  def greet_players
    puts "Welcome to Tic Tac Toe"
  end

  def show_rules
    puts "The game will end either when a player wins by placing their mark across a row, column or diagonally, or all the positions are taken\n"
  end

  def choose_game_type
    puts "Type 'hh' to play Human vs Human. Type 'hc' to play Human vs Computer\n"
  end

  def prompt_player(mark)
    print "\nPlayer #{mark}, make a move: "
  end

  def take_input
    input = gets.chomp
    input
  end

  def notify_invalid(x)
    puts "Invalid #{x}"
  end

  def announce_tie
    puts "\nIt's a tie!"
  end

  def announce_win(mark)
    puts "\n#{mark} wins!"
  end

  def clear_screen
    system('clear') 
  end

  def show_outcome(board, current_player, game) 
    clear_screen
    show_board(board.board_grid)
    game.is_a_tie? == true ? announce_tie : announce_win(current_player.mark)
  end
end
