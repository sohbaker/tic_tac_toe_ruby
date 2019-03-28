class Human
  attr_reader :mark

  def initialize(mark)
    @mark = mark.upcase
  end
end
