require 'tictactoe_jules'

describe Tictactoe_jules do

  before(:each) do
    @player_x = Human_player.new('Player 1', 'X')
    @player_o = Human_player.new('Player 2', 'O')
  end

  it 'Returns current player X on turn 1' do
    tictactoe_jules = Tictactoe_jules.new(@player_x, @player_o, Board.new)
    expect(tictactoe_jules.current_player).to eq(@player_x)
  end

  it 'Makes a move and returns current player O' do
    tictactoe_jules = Tictactoe_jules.new(@player_x, @player_o, Board.new)
    tictactoe_jules.submit_move(5)
    expect(tictactoe_jules.current_player).to eq(@player_o)
  end

  it 'Tracks whether the game is over' do
    tictactoe_jules = Tictactoe_jules.new(@player_x, @player_o, Board.new)
    expect(tictactoe_jules.game_is_over).to eq(false)
  end
end
