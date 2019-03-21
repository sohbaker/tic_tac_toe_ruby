class Display
  def get_move
    move = gets.chomp.to_i
  end

  def announce_tie
    "It's a tie!"
  end

  def announce_win
    " wins!"
  end
end
