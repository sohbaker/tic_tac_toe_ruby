class Board
  attr_reader :current_board

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

  PLAYER_MARKS = ["X", "O"]

  def initialize(board)
    @current_board = board
  end

  def mark_board(move, mark)
    position = move.to_i - 1
    @current_board[position] = mark.upcase
    @current_board
  end
 
  def clear_mark(move)
    position = move.to_i - 1
    @current_board[position] = move
  end

  def get_opponent_mark(given_mark)
    opponent = PLAYER_MARKS.reject{|player_mark| player_mark == given_mark}
    opponent[0]
  end

  def available_moves
    available_moves = []
    @current_board.each do |spot|
      if spot != "X" && spot != "O"
        available_moves.push(spot)
      end
    end
    available_moves
  end

  def player_wins?(mark)
    WINNING_COMBINATIONS.any? do |combination|
      combination.all? { |position| @current_board[position] == mark.upcase }
    end
  end

  def full?
    available_moves.empty?
  end
end
