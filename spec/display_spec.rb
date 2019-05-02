require "spec_helper"
require "game"
require "display"
require "human_double"
require "board_double"
require "stub_display"

RSpec.describe Display do

  describe "#greet_players" do
    it "greets the players when the game starts" do

      expect do
        Display.new.greet_players
      end.to output("Welcome to Tic Tac Toe\n").to_stdout
    end
  end
 
  describe "#prompt_choose_game_type" do 
    it "prompts user to select a game type" do 
      expect do 
        Display.new.prompt_choose_game_type
      end.to output("Type 'hh' to play Human vs Human. Type 'hc' to play Human vs Computer\n").to_stdout
    end
  end
  
  describe "#show_board" do
    it "shows a board" do

      expect do
        Display.new.show_board(empty_board)
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
      game = Game.new(BoardDouble.new(empty_board), StubDisplay.new, HumanDouble.new("X", self), HumanDouble.new("O", self))

      expect do
        Display.new.prompt_player(game.current_player.mark)
      end.to output("\nPlayer X, make a move: ").to_stdout
    end
  end

  describe "#notify_invalid" do
    it "tell the player they have attempted an invalid move" do
      expect do
        Display.new.notify_invalid("move")
      end.to output("Invalid move\n").to_stdout
    end
  end

  describe "#announce_tie" do
    it "returns 'it's a tie' when the game has ended and resulted in a tie" do
      expect do
        Display.new.announce_tie
      end.to output("\nIt's a tie!\n").to_stdout
    end
  end

  describe "#announce_win" do
    it "returns 'X wins!' when the game has ended because a player has won" do
      game = Game.new(BoardDouble.new(player_has_won), StubDisplay.new, HumanDouble.new("X", self), HumanDouble.new("O", self))

      expect do
        Display.new.announce_win(game.current_player.mark)
      end.to output("\nX wins!\n").to_stdout
    end
  end
end
