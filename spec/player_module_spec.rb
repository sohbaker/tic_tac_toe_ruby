require "player_module"

class BoardDouble 
end

RSpec.describe Player do
  it "returns two objects" do 
    expect(Player.generate("hh", BoardDouble.new).length).to eq(2)
  end
end

