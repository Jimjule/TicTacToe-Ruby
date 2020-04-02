require 'game'

describe Game do

  before(:each) do
    @inOut = ConsoleInOut.new(STDIN, STDOUT)
    @player_x = Player.new('Player 1', 'X')
    @player_o = Player.new('Player 2', 'O')
  end

  it 'Win with row 4x4' do
    allow_any_instance_of(ConsoleInOut).to receive(:gets).and_return('4')
    board = Board.new(@inOut, @inOut.set_board_size, true)
    game = Game.new(true, @inOut, @player_x, @player_o, board)
    allow(game.inOut).to receive(:gets).and_return('9', '2', '5', '3', '8', '4', '6', '1')
    game.go
    expect(game.winner).to be true
  end

  it 'Win with column 5x5' do
    allow_any_instance_of(ConsoleInOut).to receive(:gets).and_return('5')
    board = Board.new(@inOut, @inOut.set_board_size, true)
    game = Game.new(true, @inOut, @player_x, @player_o, board)
    allow(game.inOut).to receive(:gets).and_return('1', '2', '6', '5', '11', '12', '21', '17', '16', '22')
    game.go
    expect(game.winner).to be true
  end

  it 'Win with column 7x7' do
    allow_any_instance_of(ConsoleInOut).to receive(:gets).and_return('7')
    board = Board.new(@inOut, @inOut.set_board_size, true)
    game = Game.new(true, @inOut, @player_x, @player_o, board)
    allow(game.inOut).to receive(:gets).and_return('1', '2', '9', '5', '17', '12', '25', '18', '33', '22', '41', '30', '49')
    game.go
    expect(game.winner).to be true
  end
end
