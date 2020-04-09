class Square
  attr_reader :value, :id

  def initialize(id)
    @id = id
    @square_is_free = true
    @value = id
  end

  def mark(player_mark)
    if @square_is_free
      @square_is_free = false
      @value = player_mark
    end
  end
  
  def is_square_free?
    @square_is_free
  end
end