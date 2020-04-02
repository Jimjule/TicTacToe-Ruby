class ConsoleInOut
  attr_reader :input, :output

  def initialize(input, output)
    @input = input
    @output = output
  end

  def get_input
    @input.gets
  end

  def write(to_write)
    if @output.kind_of?(Array)
      @output.push(to_write)
    elsif @output.kind_of?(String)
      @output = to_write
    else
      @output.puts(to_write)
    end
  end

  def get_player_name(current_player)
    write("Please enter a name for #{current_player}")
    player_name = gets.chomp
    valid_player_name(player_name, current_player)
  end

  def valid_player_name(player_name, current_player)
    player_name.length <= 50 ? player_name : get_player_name(current_player)
  end

  def set_board_size
    write('Please enter the length of a board side')
    board_size = gets.chomp.to_i
    valid_board_size(board_size)
  end

  def valid_board_size(board_size)
    board_size.is_a?(Integer) && board_size.positive? ? board_size : set_board_size
  end

  def select_move(max_turns)
    write("Please enter a free number from 1-#{max_turns}")
    player_input = gets.chomp.to_i
    valid_player_input(player_input, max_turns)
  end

  def valid_player_input(player_input, max_turns)
    player_input >= 1 && player_input <= max_turns ? player_input : select_move(max_turns)
  end
end
