class DisplayDouble
  def initialize(moves)
    @moves = moves
  end

  def get_move(board)
    move = @moves.shift
    while !valid?(move, board)
      puts "Invalid move"
      move = @moves.shift
    end
    move
  end

  def valid?(move, board)
    board.available_moves.include?(move)
  end

  def announce_tie
    "It's a tie!"
  end

  def announce_win
    " wins!"
  end
end
