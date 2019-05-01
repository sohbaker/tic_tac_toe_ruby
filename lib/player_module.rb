require "human"
require "computer"

module Player
  def self.generate(type, board, display)
    if type == "hh"
      players = [Human.new("X", display), Human.new("O", display)]
    elsif type == "hc"
      players = [Human.new("X", display), Computer.new("O", board, display)]
    end

    players
  end
end
