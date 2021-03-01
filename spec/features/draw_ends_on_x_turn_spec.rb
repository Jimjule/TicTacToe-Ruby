require 'tictactoe_jules'
require 'human_player'
require 'board'

describe 'Drawing a game' do
  it 'Ends with player X' do
    player_x = Human_player.new('Player 1', 'X')
    player_o = Human_player.new('Player 2', 'O')
    board = Board.new
    tictactoe_jules = Tictactoe_jules.new(player_x, player_o, board)
    tictactoe_jules.submit_move('1')
    tictactoe_jules.submit_move('2')
    tictactoe_jules.submit_move('3')
    tictactoe_jules.submit_move('4')
    tictactoe_jules.submit_move('6')
    tictactoe_jules.submit_move('5')
    tictactoe_jules.submit_move('7')
    tictactoe_jules.submit_move('9')
    tictactoe_jules.submit_move('8')
    expect(tictactoe_jules.winner).to eq false
    expect(tictactoe_jules.current_player.mark).to eq 'O'
  end
end
