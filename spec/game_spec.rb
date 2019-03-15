require 'game'

RSpec.describe Game do
    it "creates a new board" do
        game = Game.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
        expect(game.show_board).to eq("""
        1 | 2 | 3
        ---------
        4 | 5 | 6
        ---------
        7 | 8 | 9""")
    end

    it "retrieves the mark for player 1" do
        game = Game.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
        expect(game.get_player1).to eq('X')
    end

    it "retrieves the mark for player 2" do
        game = Game.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
        expect(game.get_player2).to eq('O')
    end

    it "allows the player to make a move if the move is valid" do
        game = Game.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
        game.show_board
        expect(game.make_move(1)).to eq(true)
    end

    it "checks if the current player has won after making their move" do
        game = Game.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
        game.show_board
        game.make_move(2)
        expect(game.has_player_won).to eq(false)
    end

    it "switches the player" do
        game = Game.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
        expect(game.switch_player).to eq('O')
    end

    it "knows when player has won the game" do
        game = Game.new(["O", "X", 3, "O", "X", 6, "O", "X", "9"])
        expect(game.has_player_won).to eq(true)
    end
end