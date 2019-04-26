require "spec_helper"
require "game"
require "human"

class StubDisplay
  def show_board(_board)
  end

  def announce_tie
  end
  
  def announce_win(player)
  end

  def clear_screen
  end
end

RSpec.describe Game do
 it "knows that the game can continue" do
   game = Game.new(Board.new(empty_board), StubDisplay.new)
    game.instance_variable_set(:@current_player, Human.new("X"))
    game.complete_move(1, "X")
    game.complete_move(2, "O")
    expect(game.over?).to eq(false)
  end

  it "knows the game has ended with a tie" do
    moves = tied_game_sequence
    game = Game.new(Board.new(empty_board), StubDisplay.new)
    game.create_players("hh")
    mark = game.current_player.mark
    until moves.empty?
      game.complete_move(moves.shift, mark)
      game.toggle_player
      game.is_a_tie?
    end
    expect(game.show_outcome).to eq(game.display.announce_tie)
  end

  it "knows when a player has won the game" do
    moves = x_wins_sequence
    game = Game.new(Board.new(empty_board), StubDisplay.new)
    game.create_players("hh")
    mark = game.current_player.mark
    until moves.empty?
      game.complete_move(moves.shift, mark)
      game.toggle_player
    end
    expect(game.show_outcome).to eq(game.display.announce_win(mark))
  end
end
