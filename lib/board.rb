class Board 
    def initialize(board)
        @board = board
        @winning_combinations = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8],
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8],
            [2, 4, 6],
            [0, 4, 8]
        ]
        @check_combinations = false
    end

    def print_board
        return """
        #{@board[0]} | #{@board[1]} | #{@board[2]}
        ---------
        #{@board[3]} | #{@board[4]} | #{@board[5]}
        ---------
        #{@board[6]} | #{@board[7]} | #{@board[8]}"""
    end

    def mark_board(move, player)
        position = move - 1
        @board[position] = player
        print_board()
    end

    def is_valid_move(move)
        position = move - 1
        return @board[position].is_a?(Integer)
    end

    def has_current_player_won(mark)
        @winning_combinations.each do | combination |
            position1 = combination[0]
            position2 = combination[1]
            position3 = combination[2]
            if @board[position1] == mark && @board[position2] == mark && @board[position3] == mark
                @check_combinations = true
            end
        end
        return @check_combinations
    end

    def game_is_a_tie
        moves = 0
        @board.each do | el |
            if el.is_a?(String)
                moves += 1
            end
        end
        return moves == 9 && @check_combinations == false
    end
end