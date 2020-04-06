class Player
  attr_reader :id, :mark
  def initialize(id, mark, inOut)
    @inOut = inOut
    @id = id
    @mark = mark
  end

  def make_move
    @inOut.select_move
  end
end
