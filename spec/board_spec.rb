require 'board'
require 'validate'

describe Board do

  before(:each) do
    console_in_out = ConsoleInOut.new('', '')
    validate = Validate.new
    @board = Board.new(console_in_out, validate)
  end

  it 'Displays a board' do
    expect(@board.inOut.output).to eq([["-----"], "|123|", "|456|", "|789|", ["-----"]])
  end

  it 'Contains a number of squares equal to max turns' do
    expect(@board.squares.count).to eq(@board.max_turns)
  end

  it 'Gives the first square id 1' do
    expect(@board.squares[0].id).to eq(1)
  end

  it 'Gives each square a distinct id' do
    expect(@board.squares[5].id).to eq(6)
  end

  it 'Checks square is free' do
    expect(@board.is_square_free?(1)).to eq(true)
  end

  it 'Makes a move and checks that the square is occupied' do
    @board.make_move('X', 1)
    expect(@board.is_square_free?(1)).to eq(false)
  end

  it 'Views the board' do
    @board.view_board
    expect(@board.inOut.output.last).to eq([["-----"], "|123|", "|456|", "|789|", ["-----"]])
  end

  it 'Checks for a winner' do
    player = Player.new('Player 1', 'X')
    expect(@board.check_for_winner(player)).to eq(false)
  end
end
