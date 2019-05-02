require "spec_helper"
require "player_factory"
require "stub_display"
require "board_double"

RSpec.describe PlayerFactory do
  it "returns two objects" do 
    expect(Player.generate("hh", BoardDouble.new(empty_board), StubDisplay.new).length).to eq(2)
  end
end

