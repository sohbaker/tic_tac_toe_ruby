class DisplayDouble
  def initialize(moves)
    @moves = moves
  end

  def prompt_player(mark)
    print "\nPlayer #{mark}, make a move: "
  end

  def get_move(player_mark)
    prompt_player(player_mark)
    move = @moves.shift
    move
  end

  def announce_tie
    puts "\nIt's a tie!"
  end

  def announce_win(mark)
    puts "\n#{mark} wins!"
  end
end
