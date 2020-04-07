class ComputerPlayer
  attr_reader :id, :mark
  def initialize(inOut)
    @id = 'Computer'
    @mark = 'O'
  end

  def make_move(max_turns)
    rand(max_turns)
  end
end
