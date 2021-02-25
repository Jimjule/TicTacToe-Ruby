require 'tictactoe_jules'

describe Tictactoe_jules do
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }

  before(:each) do
    @in_out = Console_in_out.new(input, output)
    @player_x = Human_player.new('Player 1', 'X', @in_out)
    @player_o = Human_player.new('Player 2', 'O', @in_out)
  end

  it 'Returns current player X' do
    board = Board.new
    tictactoe_jules = Tictactoe_jules.new(@player_x, @player_o, board)
    expect(tictactoe_jules.current_player).to eq(@player_x)
  end

  it 'Asks for board size input' do
    board = Board.new(4)
    tictactoe_jules = Tictactoe_jules.new(@player_x, @player_o, board)
    expect(tictactoe_jules.board.board_size).to eq 4
  end
end
