class Display
  def show_board(grid)
    puts "" "
    #{grid[0]} | #{grid[1]} | #{grid[2]}
    ---------
    #{grid[3]} | #{grid[4]} | #{grid[5]}
    ---------
    #{grid[6]} | #{grid[7]} | #{grid[8]}" ""
  end

  def show_welcome_instructions
    greet_players
    show_rules
  end

  def greet_players
    puts "Welcome to Tic Tac Toe"
  end

  def show_rules
    puts "The game will end either when a player wins by placing their mark across a row, column or diagonally, or all the positions are taken\n"
  end

  def get_game_type
    choose_game_type
    type = take_input
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

  def pause_message
    puts "...thinking..."
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

  def show_outcome(board, mark) 
    clear_screen
    show_board(board.grid)
    board.player_wins?(mark) ? announce_win(mark) : announce_tie  
  end
end
