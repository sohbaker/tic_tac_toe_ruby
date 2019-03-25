require "game"
require "display"
require "board_conditions"

RSpec.describe Display do
  get_board = BoardConditions.new
  board = get_board.brand_new_game

  it "greets the players when the game starts" do
    game = Game.new(board)
    display = Display.new(game)
    allow(display).to receive(:greet_players)
    # game.play_game

    expect(display).to have_received(:greet_players)
  end
end
