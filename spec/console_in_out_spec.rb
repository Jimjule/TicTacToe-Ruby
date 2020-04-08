require 'console_in_out'
require './spec/mocks/console_mock.rb'

describe Console_in_out do

  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  let(:console_in_out) { Console_in_out.new(input, output) }

  it 'Writes to output' do
    input = "It's a string!"
    console_in_out.print(input)
    expect(console_in_out.output.string).to eq("It's a string!\n")
  end

  it 'Gets player name' do
    input = 'A name'
    console_in_out = ConsoleMock.new(input, output)
    expect(console_in_out.get_string(Human_player.new('1', 'X', console_in_out))).to eq("A name")
  end

  it 'Sets board size' do
    input = '6'
    console_in_out = ConsoleMock.new(input, output)
    expect(console_in_out.set_board_size).to eq(6)
  end

  it 'Gets a move' do
    input = '8'
    console_in_out = ConsoleMock.new(input, output)
    expect(console_in_out.select_move).to eq 8
  end

  it 'Entering y returns true' do
    input = 'y'
    console_in_out = ConsoleMock.new(input, output)
    expect(console_in_out.play_against_computer?(input)).to eq true
  end

  it 'Not entering y returns false' do
    input = 'nope'
    console_in_out = ConsoleMock.new(input, output)
    expect(console_in_out.play_against_computer?(input)).to eq false
  end
end
