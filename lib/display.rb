class Display
  def get_move(board)
    input = gets.chomp
    while !valid?(input, board)
      puts "Invalid move"
      input = gets.chomp
    end
    input
  end

  def valid?(input, board)
    board.available_moves.include?(input)
  end

  def announce_tie
    "It's a tie!"
  end

  def announce_win
    " wins!"
  end
end
