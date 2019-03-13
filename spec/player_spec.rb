require 'player'

RSpec.describe Player do
    it "sets players marks depending on player 1's choice" do
        player = Player.new
        player.set_players("x")
        expect(player.player1).to eq('X')
        expect(player.player2).to eq('O')
    end
end
