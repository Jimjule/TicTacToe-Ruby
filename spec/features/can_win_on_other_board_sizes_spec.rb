require 'game'

describe Game do
  before(:each) do
    @inOut = ConsoleInOut.new('', '')
    @validate = Validate.new
    @player_x = HumanPlayer.new('Player 1', 'X', @inOut)
    @player_o = HumanPlayer.new('Player 2', 'O', @inOut)
  end

  it 'Win with row 4x4' do
    board = Board.new(@inOut, @validate, 4)
    game = Game.new(@inOut, @player_x, @player_o, board)
    allow(game.inOut).to receive(:gets).and_return('9', '2', '5', '3', '8', '4', '6', '1')
    game.go
    expect(game.winner).to be true
  end

  it 'Win with column 5x5' do
    board = Board.new(@inOut, @validate, 5)
    game = Game.new(@inOut, @player_x, @player_o, board)
    allow(game.inOut).to receive(:gets).and_return('1', '2', '6', '5', '11', '12', '21', '17', '16', '22')
    game.go
    expect(game.winner).to be true
  end

  it 'Win with column 7x7' do
    board = Board.new(@inOut, @validate, 7)
    game = Game.new(@inOut, @player_x, @player_o, board)
    allow(game.inOut).to receive(:gets).and_return('1', '2', '9', '5', '17', '12', '25', '18', '33', '22', '41', '30', '49')
    game.go
    expect(game.winner).to be true
  end
end
