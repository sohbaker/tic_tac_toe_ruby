# just get rid of this? only holds data doesn't have any behaviours. maybe the human or the computer should know it's mark. Pull this out to somewhere else

# who are the clients of player?
# game - asks
# display - asks player for their mark

class Player
  attr_reader :mark

  def initialize(mark)
    @mark = mark.upcase
  end
end
