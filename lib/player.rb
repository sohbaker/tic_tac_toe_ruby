class Player
    def initialize
        @player1 = ""
        @player2 = ""
        @marks = ["X", "O"]
    end

    def set_players(choice)
        @marks.each do | mark |
            if choice.upcase != mark
                @player2 = mark
            end
        @player1 = choice.upcase
        end
    end   
    
    def player1
        @player1
    end

    def player2
        @player2
    end
end