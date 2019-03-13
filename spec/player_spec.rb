require 'player'

RSpec.describe Player do
    it "sets player1's mark depending on the user choice" do
        player = Player.new
        expect(player.set_player1("x")).to eq('X')
    end

    it "sets player2's mark depending on the user choice" do
        player = Player.new
        expect(player.set_player2("o")).to eq('O')
    end
end
