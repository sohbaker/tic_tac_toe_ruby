class DisplayDouble
  def initialize(moves)
    @moves = moves
  end

  def get_move
    @moves.shift
  end

  def announce_tie
    puts "It's a tie!"
  end

  def announce_win
    puts " wins!"
  end
end
