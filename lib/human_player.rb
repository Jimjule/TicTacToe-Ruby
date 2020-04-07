class Human_player
  attr_reader :id, :mark
  def initialize(id, mark, in_out)
    @in_out = in_out
    @id = id
    @mark = mark
  end

  def make_move(max_turns)
    @in_out.select_move - 1
  end
end
