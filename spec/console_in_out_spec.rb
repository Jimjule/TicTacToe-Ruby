require 'consoleInOut'

describe ConsoleInOut do
  it 'Writes to output' do
    input = "It's a string!"
    output = []
    consoleInOut = ConsoleInOut.new(input, output)
    consoleInOut.write(input)
    expect(consoleInOut.output[0]).to eq("It's a string!")
  end

  it 'Validates board size' do
    input = ''
    output = []
    consoleInOut = ConsoleInOut.new(input, output)
    consoleInOut.valid_board_size(13)
    expect(consoleInOut).not_to receive(:set_board_size)
  end

  it 'Validates player move' do
    input = ''
    output = []
    consoleInOut = ConsoleInOut.new(input, output)
    consoleInOut.valid_player_input(5, 9)
    expect(consoleInOut).not_to receive(:select_move)
  end
end
