require 'board'

describe Board do

  before(:each) do
    @consoleInOut = ConsoleInOut.new('', '')
  end

  it 'Displays a board' do
    board = Board.new(@consoleInOut)
    expect(board.inOut.output.join).to eq("-----|123||456||789|-----")
  end

  it 'Makes a move' do
    board = Board.new(@consoleInOut)
    board.make_move('X', 0, 1)
    board.make_move('O', 0, 0)
    expect(board.board_middle[0].join).to eq('OX3')
  end
end
