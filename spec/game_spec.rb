require 'game'

RSpec.describe Game do
    it "creates a new board" do
        game = Game.new
        expect(game.show_board).to eq("""
        1 | 2 | 3
        ---------
        4 | 5 | 6
        ---------
        7 | 8 | 9""")
    end
end