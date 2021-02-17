require 'tictactoe_jules'
require 'board'
require 'validate'

describe Tictactoe_jules do
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  let(:validate) { Validate.new }

  before(:each) do
    in_out = Console_in_out.new(input, output, validate)
    player_x = Human_player.new('Player 1', 'X', in_out)
    player_o = Human_player.new('Player 2', 'O', in_out)
    board = Board.new
    @game = Tictactoe_jules.new(in_out, player_x, player_o, board)
  end

  it 'Can win diagonally falling' do
    allow(@game.in_out.input).to receive(:gets).and_return('9', '2', '5', '3', '1', '4', '6', '7', '8')
    @game.go
    expect(@game.turn_count).to eq 5
    expect(@game.winner).to be true
  end

  it 'Can win diagonally rising' do
    allow(@game.in_out.input).to receive(:gets).and_return('9', '5', '2', '7', '1', '4', '6', '3', '8')
    @game.go
    expect(@game.turn_count).to eq 8
    expect(@game.winner).to be true
  end

  it 'Can win a row' do
    allow(@game.in_out.input).to receive(:gets).and_return('9', '1', '7', '2', '6', '3', '4', '5', '8')
    @game.go
    expect(@game.turn_count).to eq 6
    expect(@game.winner).to eq true
  end

  it 'Can win a column' do
    allow(@game.in_out.input).to receive(:gets).and_return('1', '2', '4', '5', '7', '8', '3', '6', '9')
    @game.go
    expect(@game.turn_count).to eq 5
    expect(@game.winner).to be true
  end

  it 'Can win with the second column' do
    allow(@game.in_out.input).to receive(:gets).and_return('8', '1', '5', '4', '2', '6', '7', '3', '9')
    @game.go
    expect(@game.turn_count).to eq 5
    expect(@game.winner).to be true
  end
end
