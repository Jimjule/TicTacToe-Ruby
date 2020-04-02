require 'console_in_out'
require './spec/mocks/console_mock.rb'

describe ConsoleInOut do
  it 'Writes to output' do
    input = "It's a string!"
    output = []
    console_in_out = ConsoleInOut.new(input, output)
    console_in_out.write(input)
    expect(console_in_out.output[0]).to eq("It's a string!")
  end

  it 'Validates board size' do
    input = ''
    output = []
    console_in_out = ConsoleInOut.new(input, output)
    console_in_out.valid_board_size(13)
    expect(console_in_out).not_to receive(:set_board_size)
  end

  it 'Validates player move' do
    input = ''
    output = []
    console_in_out = ConsoleInOut.new(input, output)
    console_in_out.valid_player_input(5, 9)
    expect(console_in_out).not_to receive(:select_move)
  end

  it 'Gets input' do
    input = "It's a string!"
    output = []
    console_in_out = ConsoleMock.new(input, output)
    expect(console_in_out.get_input).to eq("It's a string!")
  end
end
