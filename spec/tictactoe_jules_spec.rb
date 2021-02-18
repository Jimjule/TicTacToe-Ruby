require 'tictactoe_jules'
require 'console_in_out'

describe Tictactoe_jules do
  it 'Sets up a game' do
    console_in_out = Console_in_out.new(STDIN, STDOUT)
    allow(console_in_out.input).to receive(:gets).and_return('X', 'n', 'O','3')
    @tictactoe_jules = Tictactoe_jules.new(console_in_out)
    expect(@tictactoe_jules.game).to be_a_kind_of(Game)
  end
end
