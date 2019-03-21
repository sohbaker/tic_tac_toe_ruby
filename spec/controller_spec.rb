require "controller"
require "display_double"

describe Controller do
  it "returns 'it's a tie' when the game has ended and resulted in a tie" do
    display = DisplayDouble.new([9, 5, 1, 6, 4, 7, 3, 2, 8])
    allow(display).to receive(:announce_tie)
    board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    controller = Controller.new(board, display)
    controller.play_game

    expect(display).to have_received(:announce_tie)
  end

  it "returns 'x wins' when the game has ended because player x has won the game" do
    display = DisplayDouble.new([1, 4, 2, 5, 3])
    allow(display).to receive(:announce_win)
    board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    controller = Controller.new(board, display)
    controller.play_game

    expect(display).to have_received(:announce_win)
  end
end
