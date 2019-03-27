require "board"

RSpec.describe Board do
  it "adds a mark to a board" do
    board = Board.new
    expect(board.mark_board(1, "x")).to eq(["X", "2", "3", "4", "5", "6", "7", "8", "9"])
  end

  it "knows the winning combinations and returns true if player has won" do
    board = Board.new
    board.mark_board(1, "x")
    board.mark_board(2, "x")
    board.mark_board(3, "x")
    expect(board.current_player_wins?("x")).to eq(true)
  end

  it "knows the winning combinations and returns false if player has not won" do
    board = Board.new
    board.mark_board(1, "x")
    board.mark_board(4, "x")
    board.mark_board(7, "x")
    expect(board.current_player_wins?("o")).to eq(false)
  end

  it "knows when the game is a tie" do
    board = Board.new
    board.instance_variable_set(:@board_array, ["x", "x", "o", "o", "x", "x", "x", "o", "o"])
    expect(board.full?).to eq(true)
  end
end
