class Human
  attr_reader :mark

  def initialize(mark, display)
    @mark = mark
    @display = display 
  end

  def get_move
    @display.take_input
  end
end
