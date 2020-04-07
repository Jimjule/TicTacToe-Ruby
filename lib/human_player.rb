class Human_player
  attr_reader :id, :mark
  def initialize(id, mark, inOut)
    @inOut = inOut
    @id = id
    @mark = mark
  end

  def make_move(max_turns)
    @inOut.select_move - 1
  end
end
