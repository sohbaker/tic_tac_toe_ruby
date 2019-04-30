require "human"
require "computer"

class Players
  attr_reader :player_1, :player_2
  
  def initialize(game_type, board, display)
    @type = game_type 
    @board = board
    @display = display
  end
 
  def validate_type
    until @type == "hh" || @type == "hc"
      @display.notify_invalid("choice")
      @type = @display.take_input
    end
  end 

  def create_players
    if @type == "hh"
      @player_1, @player_2 = Human.new("X"), Human.new("O")
    else 
      @player_1, @player_2 = Human.new("X"), Computer.new("O", @board) 
    end
  end
end
