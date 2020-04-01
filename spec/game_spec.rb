require 'game'


describe Game do
  it 'Displays a board' do
    allow_any_instance_of(Input).to receive(:gets).and_return('Player 1', 'Player 2', '3')
    expect { Game.new }.to output("Welcome to TicTacToe\nPlease enter a name for X\nPlease enter a name for O\nPlease enter the length of a board side\n-----\n|123|\n|456|\n|789|\n-----\n").to_stdout
  end

  it 'Asks for board size input' do
    allow_any_instance_of(Input).to receive(:gets).and_return('4')
    game = Game.new
    expect(game.board.board_size).to eq 4
  end
end
