require 'tictactoe_jules'

describe Tictactoe_jules do
  before(:each) do
    @player_x = Human_player.new('Player 1', 'X')
    @player_o = Human_player.new('Player 2', 'O')
  end

  it 'Win with row 4x4' do
    board = Board.new(4)
    tictactoe_jules = Tictactoe_jules.new(@player_x, @player_o, board)
    tictactoe_jules.submit_move('9')
    tictactoe_jules.submit_move('2')
    tictactoe_jules.submit_move('5')
    tictactoe_jules.submit_move('3')
    tictactoe_jules.submit_move('8')
    tictactoe_jules.submit_move('4')
    tictactoe_jules.submit_move('6')
    tictactoe_jules.submit_move('1')
    expect(tictactoe_jules.winner).to be true
  end

  it 'Win with column 5x5' do
    board = Board.new(5)
    tictactoe_jules = Tictactoe_jules.new(@player_x, @player_o, board)
    tictactoe_jules.submit_move('1')
    tictactoe_jules.submit_move('2')
    tictactoe_jules.submit_move('6')
    tictactoe_jules.submit_move('5')
    tictactoe_jules.submit_move('11')
    tictactoe_jules.submit_move('12')
    tictactoe_jules.submit_move('21')
    tictactoe_jules.submit_move('17')
    tictactoe_jules.submit_move('16')
    expect(tictactoe_jules.winner).to be true
  end

  it 'Win with column 7x7' do
    board = Board.new(7)
    tictactoe_jules = Tictactoe_jules.new(@player_x, @player_o, board)
    tictactoe_jules.submit_move('1')
    tictactoe_jules.submit_move('2')
    tictactoe_jules.submit_move('9')
    tictactoe_jules.submit_move('5')
    tictactoe_jules.submit_move('17')
    tictactoe_jules.submit_move('12')
    tictactoe_jules.submit_move('25')
    tictactoe_jules.submit_move('18')
    tictactoe_jules.submit_move('33')
    tictactoe_jules.submit_move('22')
    tictactoe_jules.submit_move('41')
    tictactoe_jules.submit_move('30')
    tictactoe_jules.submit_move('49')
    expect(tictactoe_jules.winner).to be true
  end
end
