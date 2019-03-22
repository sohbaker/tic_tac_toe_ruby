require "game"
require "display"

RSpec.describe Game do
  it "creates a new board" do
    display = Display.new
    board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    game = Game.new(board, display)
    expect(game.show_board).to eq("" "
    1 | 2 | 3
    ---------
    4 | 5 | 6
    ---------
    7 | 8 | 9" "")
  end

  it "allows the player to make a move if the move is valid" do
    display = Display.new
    board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    game = Game.new(board, display)
    game.show_board
    expect(game.make_move(1)).to eq("" "
    X | 2 | 3
    ---------
    4 | 5 | 6
    ---------
    7 | 8 | 9" "")
  end

  it "checks if the current player has won" do
    game = Game.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
    game.show_board
    game.make_move(2)
    expect(game.has_player_won?(game.current_player)).to eq(false)
  end

  it "switches the player" do
    game = Game.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
    expect(game.switch_player).to eq("O")
  end

  it "knows when a player has won the game" do
    game = Game.new(["O", "X", 3, "O", "X", 6, 7, "X", 9])
    expect(game.has_player_won?(game.current_player)).to eq(true)
  end

  it "knows the game has ended with a tie" do
    game = Game.new(["X", "X", "O", "O", "X", "X", "X", "O", "O"])
    expect(game.is_a_tie?).to eq(true)
  end

  it "knows that the game can continue" do
    game = Game.new([1, 2, "X", 4, "O", 6, 7, "X", 9])
    expect(game.is_over?).to eq(false)
  end

  it "doesn't allow a player to make a move that's already taken" do
    game = Game.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
    game.make_move(2)
    game.switch_player
    game.make_move(2)
    expect(game.show_board).to eq("" "
    1 | X | 3
    ---------
    4 | 5 | 6
    ---------
    7 | 8 | 9" "")
  end
end
