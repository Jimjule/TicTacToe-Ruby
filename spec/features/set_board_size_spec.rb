require 'board'

describe Board do

  before(:each) do
    @inOut = ConsoleInOut.new('', '')
  end

  it 'Can make a 4x4 board' do
    board = Board.new(@inOut, 4)
    expect(board.inOut.output.join).to eq("------|1234||5678||9101112||13141516|------")
  end

  it 'Can make a 9x9 board' do
    board = Board.new(@inOut, 6)
  end
end
