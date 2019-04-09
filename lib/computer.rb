require "./spec/spec_helper"

class Computer
  attr_reader :mark

  def initialize(mark)
    @moves = computer_player
    @mark = mark
  end

  def get_move
    @moves.sample
  end
end
