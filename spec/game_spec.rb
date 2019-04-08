require "spec_helper"
require "game"
require "human"

RSpec.describe Game do
 it "knows that the game can continue" do
    game = Game.new
    game.instance_variable_set(:@current_player, Human.new("X"))
    game.complete_move(1, "X")
    game.complete_move(2, "O")
    expect(game.over?).to eq(false)
  end

  it "knows the game has ended with a tie" do
    moves = tied_game_sequence
    game = Game.new 
    game.create_players("hh")
    mark = game.current_player.mark
    until moves.empty?
      game.complete_move(moves.shift, mark)
      game.toggle_player
      game.is_a_tie?
    end
    expect(game.outcome).to eq(game.display.announce_tie)
  end

  it "knows when a player has won the game" do
    moves = x_wins_sequence
    game = Game.new
    game.create_players("hh")
    mark = game.current_player.mark
    until moves.empty?
      game.complete_move(moves.shift, mark)
      game.toggle_player
    end
    expect(game.outcome).to eq(game.display.announce_win(mark))
  end
end
