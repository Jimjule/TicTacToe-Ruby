require 'tictactoe_jules'
require 'board'

describe 'Winning a game' do
  before(:each) do
    player_x = Computer_player.new('Computer 1', 'X')
    player_o = Computer_player.new('Computer 2', 'O')
    board = Board.new
    @tictactoe_jules = Tictactoe_jules.new(player_x, player_o, board)
  end

  it 'Player 1 can win' do
    @tictactoe_jules.submit_move('9')
    @tictactoe_jules.submit_move('2')
    @tictactoe_jules.submit_move('5')
    @tictactoe_jules.submit_move('3')
    @tictactoe_jules.submit_move('1')
    expect(@tictactoe_jules.turn_count).to eq 5
    expect(@tictactoe_jules.winner).to be true
    expect(@tictactoe_jules.current_player.id).to eq 'Computer 1'
  end

  it 'Player 2 can win' do
    @tictactoe_jules.submit_move('9')
    @tictactoe_jules.submit_move('1')
    @tictactoe_jules.submit_move('7')
    @tictactoe_jules.submit_move('2')
    @tictactoe_jules.submit_move('6')
    @tictactoe_jules.submit_move('3')
    expect(@tictactoe_jules.winner).to eq true
    expect(@tictactoe_jules.turn_count).to eq 6
    expect(@tictactoe_jules.current_player.id).to eq 'Computer 2'
  end
end
