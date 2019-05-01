require "spec_helper"
require "board"

RSpec.describe Board do
  let(:board) { Board.new }
  
  it "adds a mark to a board" do
    board.mark_board(1, "x") 
    expect(board.grid.include?("X")).to eq(true)
  end

  it "knows the winning combination and returns true if player has won" do
    board.mark_board(1, "x")
    board.mark_board(2, "x")
    board.mark_board(3, "x")
    expect(board.player_wins?("x")).to eq(true)
  end

  it "knows the winning combination and returns false if player has not won" do
    board.mark_board(1, "x")
    board.mark_board(2, "x")
    board.mark_board(3, "x")
    expect(board.player_wins?("o")).to eq(false)
  end

  it "knows when the game is a tie" do
    position = 0
    player_marks_on_a_tied_board = tied_game
    until player_marks_on_a_tied_board.empty? 
      board.mark_board(position += 1, player_marks_on_a_tied_board.shift)
      position
    end

    expect(board.full?).to eq(true)
  end
  
  it "returns the opponent player's mark when given the current player's mark" do 
    expect(board.get_opponent_mark("X")).to eq("O")
  end
end
