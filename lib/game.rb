require 'board'
require 'player'

class Game
    def initialize(board)
        @board = Board.new(board)
        @player = Player.new
        @current_player = @player.player1
    end

    def show_board
        @board.board
    end

    def current_player
        @current_player
    end

    def make_move(position)
        if @board.is_valid_move?(position) 
            @board.mark_board(position, @current_player)
            return true
        end
        false
    end

    def switch_player
        if @current_player == @player.player1
            @current_player = @player.player2
        else
            @current_player = @player.player1
        end
    end

    def has_player_won?(mark)
        if @board.current_player_wins?(@current_player)
            "#{@current_player} wins!"
        end
        false
    end

    def is_a_tie?
        if @board.is_full?
            "It's a tie!"
        end
        false
    end

    def is_over?
        if is_a_tie? 
            is_a_tie?
        elsif has_player_won?(current_player)
            has_player_won?(current_player)
        end
        false
    end
end