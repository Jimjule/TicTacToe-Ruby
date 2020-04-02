require 'board'

describe Board do

  before(:each) do
    @consoleInOut = ConsoleInOut.new('', '')
  end

  it 'Displays a board' do
    board = Board.new(@consoleInOut)
    expect(board.inOut.output).to eq([["-----"], "|123|", "|456|", "|789|", ["-----"]])
  end

  it 'Makes a move and checks that the square is occupied' do
    board = Board.new(@consoleInOut)
    board.make_move('X', 1, 1)
    expect(board.check_square_is_free(1, 1)).to eq(false)
  end

  it 'Views the board' do
    board = Board.new(@consoleInOut)
    board.view_board
    expect(@consoleInOut.output.last).to eq([["-----"], "|123|", "|456|", "|789|", ["-----"]])
  end

  it 'Checks for a winner' do
    board = Board.new(@consoleInOut)
    player = Player.new('Player 1', 'X')
    expect(board.check_for_winner(player)).to eq(false)
  end

  it 'Checks square is free' do
    board = Board.new(@consoleInOut)
    expect(board.check_square_is_free(1, 1)).to eq(true)
  end
end
