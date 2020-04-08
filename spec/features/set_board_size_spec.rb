require 'board'
require 'validate'

describe Board do

  let(:output) { StringIO.new }

  before(:each) do
    @in_out = Console_in_out.new('', output)
    @validate = Validate.new
  end

  it 'Can make a 4x4 board' do
    board = Board.new(@in_out, @validate, 4)
    expect(board.in_out.output.string).to eq("------\n|1234|\n|5678|\n|9101112|\n|13141516|\n------\n")
  end

  it 'A 9x9 board has 81 turns' do
    board = Board.new(@in_out, @validate, 9)
    expect(board.max_turns).to eq 81
  end
end
