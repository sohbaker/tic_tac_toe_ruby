require "player"

RSpec.describe Player do
  it "creates a new player with a mark" do
    player = Player.new("x")
    expect(player.mark).to eq("X")
  end
end
