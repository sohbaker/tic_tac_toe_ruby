require "spec_helper"
require "player_factory"
require "stub_display"
require "board_double"
require "game_type"

RSpec.describe PlayerFactory do
  it "returns two human players" do 
    expect(PlayerFactory.generate(GameType::HUMANHUMAN, BoardDouble.new(empty_board), StubDisplay.new).length).to eq(2)
  end

  it "returns a human and a computer player" do 
    expect(PlayerFactory.generate(GameType::HUMANCOMPUTER, BoardDouble.new(empty_board), StubDisplay.new).length).to eq(2)
  end
end

