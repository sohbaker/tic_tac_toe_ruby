class Display
  def get_move
    move = gets.chomp.to_i
  end

  def announce_tie
    puts "It's a tie!"
  end

  def announce_win
    puts " wins!"
  end
end
