require "spec_helper"
require "game"
require "human_double"

class StubDisplay
  def show_board(_board)
  end

  def announce_tie
  end
  
  def announce_win(player)
  end

  def clear_screen
  end
  
  def prompt_player(player)
  end

  def notify_invalid(selection)
  end
end

RSpec.describe Game do
 it "knows that the game can continue" do
   game = Game.new(Board.new(empty_board), StubDisplay.new, HumanDouble.new("X", ["1"]), HumanDouble.new("O", ["2"]))
    expect(game.over?).to eq(false)
  end

 it "receives a message when the game ends in a tie" do 
   game = Game.new(Board.new(empty_board), StubDisplay.new, HumanDouble.new("X", ["9","1","4","3","8"]), HumanDouble.new("O", ["5","6","7","2"]))
   allow(game).to receive(:show_outcome)

   game.play_game
   expect(game).to have_received(:show_outcome)
 end

 it "receives a message when the game ends with a win" do 
   game = Game.new(Board.new(empty_board), StubDisplay.new, HumanDouble.new("X", ["1","4","7"]), HumanDouble.new("O", ["2","3"]))
   allow(game).to receive(:show_outcome)

   game.play_game
   expect(game).to have_received(:show_outcome)
 end
end
