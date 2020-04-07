class Computer_player
  attr_reader :id, :mark
  def initialize(in_out)
    @id = 'Computer'
    @mark = 'O'
  end

  def make_move(max_turns)
    rand(max_turns) - 1
  end
end
