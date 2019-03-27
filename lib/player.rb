# just get rid of this? only holds data doesn't have any behaviours. maybe the human or the computer should know it's mark. Pull this out to somewhere else

# who are the clients of player?
# game - asks
# display - asks player for their mark

class Player
  def initialize
    @player1 = "X"
    @player2 = "O"
  end

  def player1
    @player1
  end

  def player2
    @player2
  end
end
