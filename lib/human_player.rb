class Human_player
  attr_reader :id, :mark
  def initialize(id, mark)
    @id = id
    @mark = mark
  end

  def select_move(board, move)
    move
  end
end
