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
   game = Game.new(Board.new(empty_board), StubDisplay.new, Human.new("X"), Human.new("O"))
    game.complete_move(1, "X")
    game.complete_move(2, "O")
    expect(game.over?).to eq(false)
  end

 
end
