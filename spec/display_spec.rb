require "game_double"
require "display_double"
require "board_conditions"
require "pseudo_moves"

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

  it "prompts the player to make a move" do
    game = GameDouble.new(board)
    display = Display.new(game)
    allow(display).to receive(:prompt_player)
    display.prompt_player

    expect(display).to have_received(:prompt_player)
  end

  it "returns 'it's a tie' when the game has ended and resulted in a tie" do
    board = get_board.game_is_tied
    game = GameDouble.new(board)
    display = Display.new(game)
    allow(game).to receive(:show_end_of_game_message)

    game.play_game
    display.announce_tie
    expect(game).to have_received(:show_end_of_game_message)
  end
end
