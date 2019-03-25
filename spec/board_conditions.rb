class BoardConditions
  def brand_new_game
    ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end

  def game_in_progress
    ["O", "X", "3", "O", "5", "6", "7", "X", "9"]
  end

  def game_is_tied
    ["X", "X", "O", "O", "X", "X", "X", "O", "O"]
  end

  def player_x_has_won
    ["X", "O", "O", "X", "5", "6", "X", "8", "9"]
  end
end
