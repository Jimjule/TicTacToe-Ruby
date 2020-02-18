# frozen_string_literal: true

class Player
  attr_reader :id, :mark
  def initialize(id, mark)
    @id = id
    @mark = mark
  end
end
