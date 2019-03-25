require "game"
require "display"
require "board_conditions"
require "pseudo_moves"

RSpec.describe Game do
  get_board = BoardConditions.new

  def start_game(board)
    game = Game.new(board)
    display = Display.new(game)
    game
  end

  it "allows the player to make a move" do
    board = get_board.brand_new_game
    game = start_game(board)
    expect(game.make_move(1)).to eq("" "
    X | 2 | 3
    ---------
    4 | 5 | 6
    ---------
    7 | 8 | 9" "")
  end

  it "switches the player" do
    board = get_board.brand_new_game
    game = start_game(board)
    expect(game.toggle_player).to eq("O")
  end

  it "knows when a player has won the game" do
    board = get_board.game_in_progress
    game = start_game(board)
    game.make_move(5)
    expect(game.has_player_won?(game.current_player)).to be(true)
  end

  it "knows the game has ended with a tie" do
    board = get_board.game_is_tied
    game = start_game(board)
    expect(game.is_a_tie?).to eq(true)
  end

  it "knows that the game can continue" do
    board = get_board.game_in_progress
    game = start_game(board)
    expect(game.is_over?).to eq(false)
  end

  it "knows that a player has won" do
    board = get_board.player_x_has_won
    game = start_game(board)
    expect(game.is_over?).to eq(true)
  end
end
