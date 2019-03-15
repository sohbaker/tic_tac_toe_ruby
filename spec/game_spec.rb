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

    it "retrieves the mark for player 1" do
        game = Game.new
        expect(game.get_player1).to eq('X')
    end

    it "retrieves the mark for player 2" do
        game = Game.new
        expect(game.get_player2).to eq('O')
    end

    it "allows the player to make a move if the move is valid" do
        game = Game.new
        game.show_board
        expect(game.make_move(1)).to eq(true)
    end

    it "checks if the current player has won after making their move" do
        game = Game.new
        game.show_board
        game.make_move(2)
        expect(game.has_player_won).to eq(false)
    end
end