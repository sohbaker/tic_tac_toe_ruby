require "board"
require "board_condition"

RSpec.describe Board do
  it "adds a mark to a board" do
    board = Board.new(BoardCondition::EMPTY_BOARD)
    expect(board.mark_board(1, "x")).to eq(["X", "2", "3", "4", "5", "6", "7", "8", "9"])
  end

  it "knows the winning combination and returns true if player has won" do
    board = Board.new(BoardCondition::EMPTY_BOARD)
    board.mark_board(1, "x")
    board.mark_board(2, "x")
    board.mark_board(3, "x")
    expect(board.current_player_wins?("x")).to eq(true)
  end

  it "knows the winning combination and returns false if player has not won" do
    board = Board.new(BoardCondition::EMPTY_BOARD)
    board.mark_board(1, "x")
    board.mark_board(2, "x")
    board.mark_board(3, "x")
    expect(board.current_player_wins?("o")).to eq(false)
  end

  it "knows when the game is a tie" do
    board = Board.new(BoardCondition::TIED_GAME)
    expect(board.full?).to eq(true)
  end
end
