require 'tictactoe_jules'
require 'console_in_out'

describe Tictactoe_jules do
  let(:in_out) { Console_in_out.new(StringIO.new, StringIO.new) }

  it 'Sets up a game' do
    allow(in_out.input).to receive(:gets).and_return('X', 'n', 'O','3')
    tictactoe_jules = Tictactoe_jules.new(in_out)
    expect(tictactoe_jules.game_controller.game).to be_a_kind_of(Game)
  end

  it 'Displays the welcome message' do
    allow(in_out.input).to receive(:gets).and_return('X', 'n', 'O','3')
    tictactoe_jules = Tictactoe_jules.new(in_out)
    expect(tictactoe_jules.game_controller.game.in_out.output.string).to include("Welcome to TicTacToe\n")
  end
end
