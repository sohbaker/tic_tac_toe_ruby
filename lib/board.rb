class Board
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

  def initialize(board)
    @board = board
  end

  def board
    "" "
    #{@board[0]} | #{@board[1]} | #{@board[2]}
    ---------
    #{@board[3]} | #{@board[4]} | #{@board[5]}
    ---------
    #{@board[6]} | #{@board[7]} | #{@board[8]}" ""
  end

  def mark_board(move, player)
    position = move - 1
    @board[position] = player
    board
  end

  def is_valid_move?(move)
    position = move - 1
    @board[position].is_a?(Integer)
  end

  def current_player_wins?(mark)
    WINNING_COMBINATIONS.any? do |combination|
      combination.all? { |position| @board[position] == mark }
    end
  end

  def is_full?
    moves = 0
    @board.each do |el|
      if el.is_a?(String)
        moves += 1
      end
    end
    moves == 9
  end
end
