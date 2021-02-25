require 'tictactoe_jules'

describe Tictactoe_jules do
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }

  before(:each) do
    @in_out = Console_in_out.new(input, output)
    @player_x = Human_player.new('Player 1', 'X', @in_out)
    @player_o = Human_player.new('Player 2', 'O', @in_out)
    board = Board.new
    tictactoe_jules = Tictactoe_jules.new(@player_x, @player_o, board)
    @game_controller = Game_controller.new(tictactoe_jules, @in_out)
  end

  it 'Has a method to control the tictactoe_jules flow' do
    expect(@game_controller).to respond_to(:go)
  end

  it 'Contains a tictactoe_jules instance' do
    expect(@game_controller.tictactoe_jules).to be_a_kind_of(Tictactoe_jules)
  end

  it 'Displays the welcome message' do
    allow(@in_out.input).to receive(:gets).and_return('X', 'n', 'O','3')
    tictactoe_console_setup = Tictactoe_console_setup.new(@in_out)
    expect(tictactoe_console_setup.in_out.output.string).to include("Welcome to TicTacToe\n")
  end
end
