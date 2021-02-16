require 'game'
require 'board'
require 'validate'

describe Game do
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }

  before(:each) do
    in_out = Console_in_out.new(input, output)
    validate = Validate.new
    player_x = Human_player.new('Player 1', 'X', in_out)
    player_o = Human_player.new('Player 2', 'O', in_out)
    board = Board.new(validate)
    @game = Game.new(in_out, player_x, player_o, board)
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
    expect(@game.winner).to be true
  end

  it 'Can win a row' do
    allow(@game.in_out.input).to receive(:gets).and_return('9', '1', '7', '2', '6', '3', '4', '5', '8')
    @game.go
    expect(@game.winner).to eq true
  end

  it 'Can win a column' do
    allow(@game.in_out.input).to receive(:gets).and_return('1', '2', '4', '5', '7', '8', '3', '6', '9')
    @game.go
    expect(@game.winner).to be true
  end
end
