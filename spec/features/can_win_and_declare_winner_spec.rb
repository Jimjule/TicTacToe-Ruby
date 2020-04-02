require 'game'

describe Game do
  before(:each) do
    input = ConsoleInOut.new
    player_x = Player.new('Player 1', 'X')
    player_o = Player.new('Player 2', 'O')
    board = Board.new(3, true)
    @game = Game.new(true, input, player_x, player_o, board)
  end

  it 'Can win diagonally falling' do
    allow(@game.input).to receive(:gets).and_return('9', '2', '5', '3', '1', '4', '6', '7', '8')
    @game.go
    expect(@game.winner).to be true
  end

  it 'Can win diagonally rising' do
    allow(@game.input).to receive(:gets).and_return('9', '5', '2', '7', '1', '4', '6', '3', '8')
    @game.go
    expect(@game.winner).to be true
  end

  it 'Can win a row' do
    allow(@game.input).to receive(:gets).and_return('9', '1', '7', '2', '6', '3', '4', '5', '8')
    @game.go
    expect(@game.winner).to be true
    expect { @game.go }.to output("Player 2 is the winner!\n").to_stdout
  end

  it 'Can win a column' do
    allow(@game.input).to receive(:gets).and_return('1', '2', '4', '5', '7', '8', '3', '6', '9')
    @game.go
    expect(@game.winner).to be true
  end
end
