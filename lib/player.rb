class Player
    def initialise
        @player1 = ""
        @player2 = ""
    end

    def set_player1(choice)
        choice = choice.upcase
        @player1 = choice
    end       
    
    def set_player2(choice)
        choice = choice.upcase
        @player2 = choice
    end  
end