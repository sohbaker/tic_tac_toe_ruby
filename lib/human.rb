require "display"

class Human
  attr_reader :mark

  def initialize(mark)
    @mark = mark
    @display = Display.new
  end

  def get_move
    @display.take_input
  end
end
