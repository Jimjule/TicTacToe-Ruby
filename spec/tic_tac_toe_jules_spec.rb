require 'tictactoe_jules'

describe Tictactoe_jules do
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  let(:validate) { Validate.new }

  before(:each) do
    @in_out = Console_in_out.new(input, output, validate)
    @player_x = Human_player.new('Player 1', 'X', @in_out)
    @player_o = Human_player.new('Player 2', 'O', @in_out)
  end

  it 'Returns current player X' do
    board = Board.new
    game = Tictactoe_jules.new(@in_out, @player_x, @player_o, board)
    expect(game.current_player).to eq(@player_x)
  end

  it 'Displays a board' do
    board = Board.new
    game = Tictactoe_jules.new(@in_out, @player_x, @player_o, board)
    expect(@in_out.output.string).to eq("Welcome to TicTacToe\n")
  end

  it 'Asks for board size input' do
    board = Board.new(4)
    game = Tictactoe_jules.new(@in_out, @player_x, @player_o, board)
    expect(game.board.board_size).to eq 4
  end
end
