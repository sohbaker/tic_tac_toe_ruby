require "spec_helper"
require "game"
require "display"
require "display_double"
require "board_conditions"
require "pseudo_moves"

# let(:get_board) { BoardConditions.new}
# or
# get_board::EMPTY_BOARD # naming is confusing

get_board = BoardConditions.new
moves = PseudoMoves.new

RSpec.describe Display do
  board = get_board.brand_new_game

  describe "#greet_players" do
    it "greets the players when the game starts" do
      game = Game.new(board)
      display = Display.new(game)

      expect do
        display.greet_players
      end.to output("Welcome to Tic Tac Toe\n").to_stdout
    end
  end

  describe "#prompt_player" do
    it "prompts the player to make a move" do
      game = Game.new(board)
      display = Display.new(game)

      expect do
        display.prompt_player
      end.to output("\nPlayer X, make a move: ").to_stdout
    end
  end
end

RSpec.describe DisplayDouble do
  describe "#announce_tie" do
    it "returns 'it's a tie' when the game has ended and resulted in a tie" do
      sequence = moves.tied_game_move_sequence
      board = get_board.game_is_tied
      game = Game.new(board)
      display = DisplayDouble.new(sequence, game)

      expect do
        game.show_end_of_game_message
      end.to output("\nIt's a tie!\n").to_stdout
    end
  end

  describe "#announce_win" do
    it "returns ' wins!' when the game has ended because a player has won" do
      sequence = moves.player_x_wins_move_sequence
      board = get_board.player_x_has_won
      game = Game.new(board)
      display = DisplayDouble.new(sequence, game)

      expect do
        game.show_end_of_game_message
      end.to output("\nX wins!\n").to_stdout
    end
  end
end
