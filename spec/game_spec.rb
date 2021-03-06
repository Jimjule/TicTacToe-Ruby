require 'game'

describe Game do
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }

  before(:each) do
    @in_out = Console_in_out.new(input, output)
    @player_x = Human_player.new('Player 1', 'X', @in_out)
    @player_o = Human_player.new('Player 2', 'O', @in_out)
  end

  it 'Returns current player X' do
    board = Board.new(3)
    game = Game.new(@in_out, @player_x, @player_o, board)
    expect(game.current_player).to eq(@player_x)
  end

  it 'Displays a board' do
    board = Board.new(3)
    game = Game.new(@in_out, @player_x, @player_o, board)
    expect(@in_out.output.string).to eq("Welcome to TicTacToe\n")
  end

  it 'Asks for board size input' do
    validate = Validate.new
    board = Board.new(validate, 4)
    game = Game.new(@in_out, @player_x, @player_o, board)
    expect(game.board.board_size).to eq 4
  end
end
