require "spec_helper"
require "game"
require "display"

RSpec.describe Display do
  describe "#greet_players" do
    it "greets the players when the game starts" do
      game = Game.new(Board.new(empty_board))
      display = Display.new

      expect do
        display.greet_players
      end.to output("Welcome to Tic Tac Toe\n").to_stdout
    end
  end

  describe "#show_board" do
    it "shows a board" do
      game = Game.new(Board.new(empty_board))
      display = Display.new

      expect do
        display.show_board(game.board.current_board)
      end.to output("" "
    1 | 2 | 3
    ---------
    4 | 5 | 6
    ---------
    7 | 8 | 9\n" "").to_stdout
    end
  end

  describe "#prompt_player" do
    it "prompts the player to make a move" do
      game = Game.new(Board.new(empty_board))
      game.create_players("hh")
      display = Display.new

      expect do
        display.prompt_player(game.current_player.mark)
      end.to output("\nPlayer X, make a move: ").to_stdout
    end
  end

  describe "#notify_invalid" do
    it "tell the player they have attempted an invalid move" do
      game = Game.new(Board.new(empty_board))
      display = Display.new

      expect do
        display.notify_invalid("move")
      end.to output("Invalid move\n").to_stdout
    end
  end

  describe "#announce_tie" do
    it "returns 'it's a tie' when the game has ended and resulted in a tie" do
      game = Game.new(Board.new(tied_game))
#      game.instance_variable_set(:@board, Board.new(tied_game))
      display = Display.new

      expect do
        display.announce_tie
      end.to output("\nIt's a tie!\n").to_stdout
    end
  end

  describe "#announce_win" do
    it "returns 'X wins!' when the game has ended because a player has won" do
      game = Game.new(Board.new(player_has_won))
      game.create_players("hh")
#      game.instance_variable_set(:@board, Board.new(player_has_won))
      display = Display.new

      expect do
        display.announce_win(game.current_player.mark)
      end.to output("\nX wins!\n").to_stdout
    end
  end
end
