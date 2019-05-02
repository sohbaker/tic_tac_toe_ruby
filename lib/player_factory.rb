require "human"
require "computer"
require "game_type"

module PlayerFactory
  def self.generate(type, board, display)
    if type == GameType::HUMANHUMAN 
      players = [Human.new("X", display), Human.new("O", display)]
    elsif type == GameType::HUMANCOMPUTER 
      players = [Human.new("X", display), Computer.new("O", board, display)]
    end
    players
  end
end
