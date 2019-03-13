class Board 
    def initialize
        @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
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

    def hasCurrentPlayerWon(mark)
        @winning_combinations.each do | combi |
            combi.each do | cell |
               position1 = cell[0]
               position2 = cell[1]
               position3 = cell[2]
               if@board[position1] === mark && @board[position2] === mark && @board[position2] === mark
                return true
               end
            end
        end
        return false
    end
end