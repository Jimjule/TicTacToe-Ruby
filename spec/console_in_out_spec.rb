require 'console_in_out'
require './spec/mocks/console_mock.rb'

describe ConsoleInOut do
  it 'Gets input' do
    input = "It's a string!"
    output = []
    console_in_out = ConsoleMock.new(input, output)
    expect(console_in_out.get_input).to eq("It's a string!")
  end

  it 'Writes to output' do
    input = "It's a string!"
    output = []
    console_in_out = ConsoleMock.new(input, output)
    console_in_out.print(input)
    expect(console_in_out.output[0]).to eq("It's a string!")
  end

  it 'Gets player name' do
    input = 'A name'
    output = []
    console_in_out = ConsoleMock.new(input, output)
    expect(console_in_out.get_player_name(Player.new('1', 'X'))).to eq("A name")
  end

  it 'Validates player name' do
    input = 'A name'
    output = []
    console_in_out = ConsoleMock.new(input, output)
    expect(console_in_out.valid_player_name(input, Player.new('5', 'X'))).to eq(input)
  end

  it 'Sets board size' do
    input = '6'
    output = []
    console_in_out = ConsoleMock.new(input, output)
    expect(console_in_out.set_board_size).to eq(6)
  end

  it 'Validates board size' do
    input = []
    output = []
    console_in_out = ConsoleInOut.new(input, output)
    console_in_out.valid_board_size(13)
    expect(console_in_out).not_to receive(:set_board_size)
  end

  it 'Gets a move' do
    input = '8'
    output = []
    console_in_out = ConsoleMock.new(input, output)
    expect(console_in_out.select_move(9)).to eq(8)
  end

  it 'Validates player move' do
    input = ''
    output = []
    console_in_out = ConsoleInOut.new(input, output)
    console_in_out.valid_player_input(5, 9)
    expect(console_in_out).not_to receive(:select_move)
  end
end
