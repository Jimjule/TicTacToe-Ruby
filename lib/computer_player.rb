class ComputerPlayer
  attr_reader :id, :mark
  def initialize(inOut)
    @inOut = inOut
    @id = 'Computer'
    @mark = 'O'
  end

  def make_move(max_turns, seed = rand)
    rand(max_turns)
  end
end
