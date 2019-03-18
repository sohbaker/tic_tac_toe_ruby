require 'game'

class Controller 
    def initialize(board)
        @game = Game.new(board)
        # @current_player = @game.current_player
    end

    # def run_game(position)
    #     if @game.make_move(position, current_player) 
    #         if can_continue_playing?
    #             toggle_player()
    #         end
    #         return true
    #     else
    #         puts "invalid move"
    #         return false
    #     end
    # end

    def greet_players
        puts "Welcome to Tic Tac Toe"
        puts "To make a move enter the number of the position you want to play"
        puts "Player1's mark is 'X' and Player2's mark is 'O'"
        puts "The game will end either when there's a tie or a player wins by placing their mark across a row, column or diagonally"
        print @game.show_board
    end

    def play_turn
        while !@game.is_over? do
            puts "\n"
            position = gets.chomp.to_i
            if @game.make_move(position) 
                toggle_player
            else
                puts "invalid move"
            end
        end
    end

    def toggle_player
        if !@game.is_over?
            @game.switch_player
        else 
            @game.is_over?
        end
    end

    # def display_game_is_over_message
    #     @game.is_over?
    # end
end

controller = Controller.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
controller.greet_players
controller.play_turn
# controller.display_game_is_over_message