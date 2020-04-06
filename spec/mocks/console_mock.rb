class ConsoleMock
  attr_reader :input, :output

  def initialize(input, output)
    @input = input
    @output = output
  end

  def get_input
    @input
  end

  def print(to_print)
    if @output.kind_of?(Array)
      @output.push(to_print)
    elsif @output.kind_of?(String)
      @output = to_print
    else
      @output.puts(to_print)
    end
  end

  def play_against_computer?(choice)
    choice == 'y' ? true : false
  end

  def get_player_name(current_player)
    print("Please enter a name for #{current_player}")
    player_name = get_input.chomp
  end

  def set_board_size
    print('Please enter the length of a board side')
    board_size = get_input.chomp.to_i
  end

  def select_move
    player_input = get_input.chomp.to_i
  end
end
