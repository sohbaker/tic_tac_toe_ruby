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

    it "allows the player to make a move if the move is valid" do
        game = Game.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
        game.show_board
        expect(game.make_move(1, game.current_player)).to eq(true)
    end

    it "checks if the current player has won after making their move" do
        game = Game.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
        game.show_board
        game.make_move(2, game.current_player)
        expect(game.has_player_won('X')).to eq(false)
    end

    it "switches the player" do
        game = Game.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
        expect(game.switch_player).to eq('O')
    end

    it "knows when a player has won the game" do
        game = Game.new(["O", "X", 3, "O", "X", 6, 7, "X", 9])
        expect(game.has_player_won(game.current_player)).to eq(true)
    end

    it "displays a message to say player has won the game" do
        game = Game.new(["O", "X", 3, "O", "X", 6, 7, "X", 9])
        expect(game.is_tie_or_is_won).to eq("X wins!")
    end

    it "knows the game has ended with a tie and displays message" do
        game = Game.new(["X", "X", "O", "O", "X", "X", "X", "O", "O"])
        expect(game.is_tie_or_is_won).to eq("It's a tie!")
    end

    it "knows that the game can continue" do
        game = Game.new([1, 2, 'X', 4, 'O', 6, 7, 'X', 9])
        expect(game.game_can_continue).to eq(true)
    end
end