require "player_module"
require "stub_display"

class BoardDouble 
end

RSpec.describe Player do
  it "returns two objects" do 
    expect(Player.generate("hh", BoardDouble.new, StubDisplay.new).length).to eq(2)
  end
end

