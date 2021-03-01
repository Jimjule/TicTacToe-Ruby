require 'tictactoe_jules'
require 'board'

describe 'Winning a game' do
  before(:each) do
    player_x = Human_player.new('Player 1', 'X')
    player_o = Human_player.new('Player 2', 'O')
    board = Board.new
    @tictactoe_jules = Tictactoe_jules.new(player_x, player_o, board)
  end

  it 'Can win diagonally falling' do
    @tictactoe_jules.submit_move('9')
    @tictactoe_jules.submit_move('2')
    @tictactoe_jules.submit_move('5')
    @tictactoe_jules.submit_move('3')
    @tictactoe_jules.submit_move('1')
    expect(@tictactoe_jules.turn_count).to eq 5
    expect(@tictactoe_jules.winner).to be true
  end

  it 'Can win diagonally rising' do
    @tictactoe_jules.submit_move('9')
    @tictactoe_jules.submit_move('5')
    @tictactoe_jules.submit_move('2')
    @tictactoe_jules.submit_move('7')
    @tictactoe_jules.submit_move('1')
    @tictactoe_jules.submit_move('4')
    @tictactoe_jules.submit_move('6')
    @tictactoe_jules.submit_move('3')
    expect(@tictactoe_jules.winner).to be true
    expect(@tictactoe_jules.turn_count).to eq 8
  end

  it 'Can win a row' do
    @tictactoe_jules.submit_move('9')
    @tictactoe_jules.submit_move('1')
    @tictactoe_jules.submit_move('7')
    @tictactoe_jules.submit_move('2')
    @tictactoe_jules.submit_move('6')
    @tictactoe_jules.submit_move('3')
    expect(@tictactoe_jules.winner).to eq true
    expect(@tictactoe_jules.turn_count).to eq 6
  end

  it 'Can win a column' do
    @tictactoe_jules.submit_move('1')
    @tictactoe_jules.submit_move('2')
    @tictactoe_jules.submit_move('4')
    @tictactoe_jules.submit_move('5')
    @tictactoe_jules.submit_move('7')
    expect(@tictactoe_jules.winner).to be true
    expect(@tictactoe_jules.turn_count).to eq 5
  end

  it 'Can win with the second column' do
    @tictactoe_jules.submit_move('8')
    @tictactoe_jules.submit_move('1')
    @tictactoe_jules.submit_move('5')
    @tictactoe_jules.submit_move('4')
    @tictactoe_jules.submit_move('2')
    expect(@tictactoe_jules.winner).to be true
    expect(@tictactoe_jules.turn_count).to eq 5
  end
end
