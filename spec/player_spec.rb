require "player"

RSpec.describe Player do
  it "sets player1's mark as X" do
    player = Player.new
    expect(player.player1).to eq("X")
  end

  it "sets player2's mark as O" do
    player = Player.new
    expect(player.player2).to eq("O")
  end
end
