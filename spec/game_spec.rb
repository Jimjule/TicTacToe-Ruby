require 'game'

describe Game do

  before(:each) do
    @input = Input.new
    @player_x = Player.new('Player 1', 'X')
    @player_o = Player.new('Player 2', 'O')
  end

  it 'Displays a board' do
    allow_any_instance_of(Input).to receive(:gets).and_return('3')
    board = Board.new(@input.set_board_size, true)
    expect { Game.new(true, @input, @player_x, @player_o, board) }.to output("Welcome to TicTacToe\n").to_stdout
  end

  it 'Asks for board size input' do
    allow_any_instance_of(Input).to receive(:gets).and_return('4')
    board = Board.new(@input.set_board_size, true)
    game = Game.new(true, @input, @player_x, @player_o, board)
    expect(game.board.board_size).to eq 4
  end
end
