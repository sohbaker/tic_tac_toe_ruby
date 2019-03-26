require "game_double"
require "display_double"
require "board_conditions"

RSpec.describe DisplayDouble do
  get_board = BoardConditions.new
  board = get_board.brand_new_game

  it "greets the players when the game starts" do
    game = GameDouble.new(board)
    display = Display.new(game)
    allow(display).to receive(:greet_players)
    display.greet_players

    expect(display).to have_received(:greet_players)
  end
end
