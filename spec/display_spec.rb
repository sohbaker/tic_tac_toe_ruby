require "game"
require "display"
require "board_conditions"
require "pseudo_moves"

RSpec.describe Display do
  get_board = BoardConditions.new
  board = get_board.brand_new_game

  describe "#greet_players" do
    it "greets the players when the game starts" do
      game = Game.new(board)
      display = Display.new(game)

      expect do
        display.greet_players
      end.to output("Welcome to Tic Tac Toe\nTo make a move enter the number of the position you want to play\nPlayer1's mark is 'X' and Player2's mark is 'O'\nThe game will end either when a player wins by placing their mark across a row, column or diagonally, or all the positions are taken\n").to_stdout
    end
  end

  # it "prompts the player to make a move" do
  #   game = GameDouble.new(board)
  #   display = Display.new(game)
  #   allow(display).to receive(:prompt_player)
  #   display.prompt_player

  #   expect(display).to have_received(:prompt_player)
  # end

  # it "returns 'it's a tie' when the game has ended and resulted in a tie" do
  #   board = get_board.game_is_tied
  #   game = GameDouble.new(board)
  #   display = Display.new(game)
  #   allow(game).to receive(:show_end_of_game_message)

  #   game.play_game
  #   display.announce_tie
  #   expect(game).to have_received(:show_end_of_game_message)
  # end

  # it "returns ' wins!' when the game has ended because a player has won" do
  #   board = get_board.player_x_has_won
  #   game = GameDouble.new(board)
  #   display = Display.new(game)
  #   allow(game).to receive(:show_end_of_game_message)

  #   game.play_game
  #   display.announce_win
  #   expect(game).to have_received(:show_end_of_game_message)
  # end
end
