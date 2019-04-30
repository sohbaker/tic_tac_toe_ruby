require "human"
require "computer"

class Player  
  def initialize(game_type, board
    @type = game_type 
    @board = board
  end
 
  def validate_type
    until @type == "hh" || @type == "hc"
      @display.notify_invalid("choice")
      @type = @display.take_input
    end
  end 

  def create_players
    if @type == "hh"
      @player1 = Human.new("X")
      @player2 = Human.new("O")
    else 
      @player1 = Human.new("X")
      @player2 = Computer.new("O", @board)
    end
  end 
end
