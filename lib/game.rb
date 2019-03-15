require 'board'
require 'player'

class Game
    def initialize
        @board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
        @player = Player.new
    end

    def show_board
        @board.print_board
    end

    def get_player1
        @player.player1
    end

    def get_player2
        @player.player2
    end
end