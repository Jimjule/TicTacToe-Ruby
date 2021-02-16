require 'board'
require 'validate'

describe Board do
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }

  before(:each) do
    @validate = Validate.new
    @in_out = Console_in_out.new(input, output, @validate)
  end

  it 'Can make a 4x4 board' do
    board = Board.new(4)
    expect(board.view_board).to eq([["------"], "|1234|", "|5678|", "|9101112|", "|13141516|", ["------"]])
  end

  it 'A 9x9 board has 81 turns' do
    board = Board.new(9)
    expect(board.max_turns).to eq 81
  end
end
