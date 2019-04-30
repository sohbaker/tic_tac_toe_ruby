require "human"
require "computer"

module Player
  def self.generate(type, board)
    if type == 'hh'
      players = [Human.new("X"), Human.new("O")]
    elsif type == "hc"
      players = [Human.new("X"), Computer.new("O", board)]
    end

    players
  end
end
