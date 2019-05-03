require "spec_helper"
require "game"
require "human_double"
require "stub_display"
require "board"

RSpec.describe Game do
  let(:board) { Board.new }
  let(:display) { StubDisplay.new }

  it "knows that the game can continue" do
    moves = [["1"], ["2"]]
    game = Game.new(board, display, *[HumanDouble.new("X", moves.shift), HumanDouble.new("O", moves.shift)])

    expect(game.over?).to eq(false)
  end

  it "receives a message when the game ends in a tie" do 
    moves = [["9","1","4","3","8"], ["5","6","7","2"]]
    game = Game.new(board, display, *[HumanDouble.new("X", moves.shift), HumanDouble.new("O", moves.shift)])
    allow(game).to receive(:show_outcome)

    game.play_game
    expect(game).to have_received(:show_outcome)
  end

  it "receives a message when the game ends with a win" do 
    moves = [["1","4","7"], ["2","3"]]
    game = Game.new(board, display, *[HumanDouble.new("X", moves.shift), HumanDouble.new("O", moves.shift)])
    allow(game).to receive(:show_outcome)

    game.play_game
    expect(game).to have_received(:show_outcome)
  end
end
