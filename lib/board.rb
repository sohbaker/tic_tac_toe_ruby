class Board
  attr_reader :board_array

  WINNING_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [2, 4, 6],
    [0, 4, 8],
  ]

  def initialize
    @board_array = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end

  def mark_board(move, mark)
    position = move.to_i - 1
    @board_array[position] = mark.upcase
    @board_array
  end

  def available_moves
    available_moves = []
    @board_array.each do |spot|
      if spot.upcase != "X" && spot.upcase != "O"
        available_moves.push(spot)
      end
    end
    available_moves
  end

  def current_player_wins?(mark)
    WINNING_COMBINATIONS.any? do |combination|
      combination.all? { |position| @board_array[position] == mark.upcase }
    end
  end

  def full?
    p @board_array
    available_moves.empty?
  end
end
