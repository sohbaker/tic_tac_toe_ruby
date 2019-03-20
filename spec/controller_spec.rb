require "controller"

RSpec.configure do |config|
  config.mock_with :rspec
end

describe Controller do
  it "returns 'it's a tie' when the game has ended and resulted in a tie" do
    allow($stdin).to_receive(:gets).and_return("8")
    controller = Controller.new(["X", "O", "X", "X", "O", "O", "O", 8, "X"])

    expect(controller.end_of_game).to eq("It's a tie!")
  end

  it "returns 'x wins' when the game has ended because player x has won the game" do
    allow($stdin).to_receive(:gets).and_return("2")
    controller = Controller.new(["X", 2, "X", "O", 5, 6, "O", 8, 9])

    expect(controller.end_of_game).to eq("X wins!")
  end
end
