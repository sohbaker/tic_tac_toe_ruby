require 'game'

class Controller 
    def initialize
        @game = Game.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end

    def take_turn(position)
        @game.make_move(position, @game.current_player)
    end

    def prints_board
        @game.show_board
    end

    def toggle_player
        @game.switch_player
    end
end
