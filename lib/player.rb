require "human"
require "computer"

class Player  
  def initialize(game_type)
    @type = game_type 
  end
 
  def validate_type
    if @type == "hh" || @type == "hc"
      @type 
    else 
      @display.notify_invalid("choice")
      @type = @display.get_game_type
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
