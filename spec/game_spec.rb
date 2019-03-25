require "game"
require "display"
require "display_double"

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

  def tied_game_move_sequence
    ["9", "5", "1", "6", "4", "7", "3", "2", "8"]
  end

  def player_x_wins_move_sequence
    ["1", "4", "2", "5", "3"]
  end

  # it "creates a new board" do
  #   game = brand_new_game
  #   expect(game.show_board).to eq("" "
  #   1 | 2 | 3
  #   ---------
  #   4 | 5 | 6
  #   ---------
  #   7 | 8 | 9" "")
  # end

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

  # it "knows that the game can continue" do
  #   game = game_in_progress
  #   expect(game.is_over?).to eq(false)
  # end

  it "returns 'it's a tie' when the game has ended and resulted in a tie" do
    display = DisplayDouble.new(tied_game_move_sequence)
    allow(display).to receive(:announce_tie)
    board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    game = Game.new(board, display)
    game.play_game

    expect(display).to have_received(:announce_tie)
  end

  it "returns 'x wins' when the game has ended because player x won" do
    display = DisplayDouble.new(player_x_wins_move_sequence)
    allow(display).to receive(:announce_win)
    board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    game = Game.new(board, display)
    game.play_game

    expect(display).to have_received(:announce_win)
  end
end
