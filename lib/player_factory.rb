require "human"
require "computer"
require "game_type"

module PlayerFactory
  def self.generate(type, board, display)
    type == GameType::HUMANHUMAN ? [Human.new("X", display), Human.new("O", display)] : [Human.new("X", display), Computer.new("O", board, display)]
  end
end
