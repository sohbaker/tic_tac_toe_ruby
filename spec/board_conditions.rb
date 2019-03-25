class BoardConditions
  def brand_new_game
    display = Display.new
    board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    Game.new(board, display)
  end

  def game_in_progress
    display = Display.new
    board = ["O", "X", "3", "O", "5", "6", "7", "X", "9"]
    Game.new(board, display)
  end

  def game_is_tied
    display = Display.new
    board = ["X", "X", "O", "O", "X", "X", "X", "O", "O"]
    Game.new(board, display)
  end

  def tied_game_move_sequence
    ["9", "5", "1", "6", "4", "7", "3", "2", "8"]
  end

  def player_x_wins_move_sequence
    ["1", "4", "2", "5", "3"]
  end
end
