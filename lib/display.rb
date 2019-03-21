class Display
  #   def get_move(board)
  #     move = gets.chomp
  #     while !board.is_valid_move?(move)
  #       puts "invalid move"
  #       move = gets.chomp
  #     end
  #     move
  #   end

  def get_move(board)
    input = gets.chomp
    while !valid?(input, board)
      puts "Invalid move"
      input = gets.chomp
    end
    input
  end

  def valid?(input, board)
    # ["1", "4", "3"]
    board.available_moves.include?(input)
  end

  def announce_tie
    "It's a tie!"
  end

  def announce_win
    " wins!"
  end
end
