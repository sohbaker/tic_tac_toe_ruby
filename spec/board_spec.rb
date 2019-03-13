require 'board'

RSpec.describe Board do
  it "prints out a new board" do
    board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
    expect(board.print_board).to eq("""
        1 | 2 | 3
        ---------
        4 | 5 | 6
        ---------
        7 | 8 | 9""")
  end

  it "adds a mark to a board" do
    board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
    expect(board.mark_board(1, 'x')).to eq("""
        x | 2 | 3
        ---------
        4 | 5 | 6
        ---------
        7 | 8 | 9""")
  end

  it "checks whether a move is valid and returns false if invalid" do
    board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
    board.mark_board(1, 'x')
    expect(board.is_valid_move(1)).to eq(false)
  end

  it "checks whether a move is valid and returns true if valid" do
    board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
    board.mark_board(1, 'x')
    expect(board.is_valid_move(2)).to eq(true)
  end

  it "knows the winning combinations for board and returns true if player has won" do
    board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
    board.mark_board(1, 'x')
    board.mark_board(2, 'x')
    board.mark_board(3, 'x')
    expect(board.has_current_player_won('x')).to eq(true)
  end

  it "knows the winning combinations for board and returns false if player has not won" do
    board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
    board.mark_board(1, 'x')
    board.mark_board(2, 'x')
    board.mark_board(3, 'x')
    expect(board.has_current_player_won('o')).to eq(false)
  end

  it "knows when the game is a tie" do
    board = Board.new(["x", "x", "o", "o", "x", "x", "x", "o", "o"])
    expect(board.game_is_a_tie).to eq(true)
  end
end
