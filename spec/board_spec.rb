require 'board'

describe Board do

  before(:each) do
    @console_in_out = ConsoleInOut.new('', '')
  end

  it 'Displays a board' do
    board = Board.new(@console_in_out)
    expect(board.inOut.output).to eq([["-----"], "|123|", "|456|", "|789|", ["-----"]])
  end

  it 'Contains a number of squares equal to max turns' do
    board = Board.new(@console_in_out)
    expect(board.squares.count).to eq(board.max_turns)
  end

  it 'Gives the first square id 1' do
    board = Board.new(@console_in_out)
    expect(board.squares[0].id).to eq(1)
  end

  it 'Gives each square a distinct id' do
    board = Board.new(@console_in_out)
    expect(board.squares[5].id).to eq(6)
  end

  it 'Checks square is free' do
    board = Board.new(@console_in_out)
    expect(board.is_square_free?(1)).to eq(true)
  end

  it 'Makes a move and checks that the square is occupied' do
    board = Board.new(@console_in_out)
    board.make_move('X', 1)
    expect(board.is_square_free?(1)).to eq(false)
  end

  it 'Views the board' do
    board = Board.new(@console_in_out)
    board.view_board
    expect(@console_in_out.output.last).to eq([["-----"], "|123|", "|456|", "|789|", ["-----"]])
  end

  it 'Checks for a winner' do
    board = Board.new(@console_in_out)
    player = Player.new('Player 1', 'X')
    expect(board.check_for_winner(player)).to eq(false)
  end
end
