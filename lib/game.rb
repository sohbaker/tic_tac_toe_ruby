require 'board'
require 'player'

class Game
    def initialize
        @board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
        @player = Player.new
        @current_player = @player.player1
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

    def make_move(position)
        if @board.is_valid_move(position) 
            @board.mark_board(position, @current_player)
            return true
        end
        return false
    end

    def has_player_won
        if @board.has_current_player_won(@current_player) == false
            return false
        else 
            return true
        end
    end
end