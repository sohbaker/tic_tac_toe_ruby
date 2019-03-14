require 'board'
require 'player'

class Game
    def initialize
        @board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end

    def show_board
        @board.print_board
    end
end