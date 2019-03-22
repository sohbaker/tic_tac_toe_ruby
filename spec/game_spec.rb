require "game"
require "display"

RSpec.describe Game do
  def brand_new_game
    display = Display.new
    board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    Game.new(board, display)
  end

  def game_in_progress
    display = Display.new
    board = ["O", "X", "3", "O", "5", "6", "7", "X", "9"]
    Game.new(board, display)
  end

  def game_is_tied
    display = Display.new
    board = ["X", "X", "O", "O", "X", "X", "X", "O", "O"]
    Game.new(board, display)
  end

  it "creates a new board" do
    game = brand_new_game
    expect(game.show_board).to eq("" "
    1 | 2 | 3
    ---------
    4 | 5 | 6
    ---------
    7 | 8 | 9" "")
  end

  it "allows the player to make a move if the move is valid" do
    game = brand_new_game
    expect(game.make_move(1)).to eq("" "
    X | 2 | 3
    ---------
    4 | 5 | 6
    ---------
    7 | 8 | 9" "")
  end

  it "switches the player" do
    game = brand_new_game
    expect(game.toggle_player).to eq("O")
  end

  it "knows when a player has won the game" do
    game = game_in_progress
    game.make_move(5)
    expect(game.has_player_won?(game.current_player)).to be(true)
  end

  it "knows the game has ended with a tie" do
    game = game_is_tied
    expect(game.is_a_tie?).to eq(true)
  end

  it "knows that the game can continue" do
    game = game_in_progress
    expect(game.is_over?).to eq(false)
  end
end
