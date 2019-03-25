require "board"

RSpec.describe Board do
  it "prints out a new board" do
    board = Board.new(["1", "2", "3", "4", "5", "6", "7", "8", "9"])
    expect(board.board).to eq("" "
    1 | 2 | 3
    ---------
    4 | 5 | 6
    ---------
    7 | 8 | 9" "")
  end

  it "adds a mark to a board" do
    board = Board.new(["1", "2", "3", "4", "5", "6", "7", "8", "9"])
    expect(board.mark_board(1, "x")).to eq("" "
    x | 2 | 3
    ---------
    4 | 5 | 6
    ---------
    7 | 8 | 9" "")
  end

  it "knows the winning combinations and returns true if player has won" do
    board = Board.new(["1", "2", "3", "4", "5", "6", "7", "8", "9"])
    board.mark_board(1, "x")
    board.mark_board(2, "x")
    board.mark_board(3, "x")
    expect(board.current_player_wins?("x")).to eq(true)
  end

  it "knows the winning combinations and returns false if player has not won" do
    board = Board.new(["1", "2", "3", "4", "5", "6", "7", "8", "9"])
    board.mark_board(1, "x")
    board.mark_board(4, "x")
    board.mark_board(7, "x")
    expect(board.current_player_wins?("o")).to eq(false)
  end

  it "knows when the game is a tie" do
    board = Board.new(["x", "x", "o", "o", "x", "x", "x", "o", "o"])
    expect(board.is_full?).to eq(true)
  end
end
