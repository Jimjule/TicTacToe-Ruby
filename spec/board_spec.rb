require 'board'
require 'validate'

describe Board do
  let(:validate) { Validate.new }
  let(:board) { Board.new }

  it 'Makes a board' do
    expect(board.get_board_values).to eq([["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]])
  end

  it 'Contains a number of squares equal to max turns' do
    expect(board.squares.count).to eq(board.max_turns)
  end

  it 'Gives the first square id 1' do
    expect(board.squares[0].id).to eq(1)
  end

  it 'Gives each square a distinct id' do
    expect(board.squares[5].id).to eq(6)
  end

  it 'Checks square is free' do
    expect(board.is_square_free?(1)).to eq(true)
  end

  it 'Makes a move and checks that the square is occupied' do
    board.make_move('X', 1)
    expect(board.is_square_free?(1)).to eq(false)
  end

  it 'Checks for a winner' do
    player = Human_player.new('Player 1', 'X', 'console')
    expect(board.check_for_winner(player)).to eq(false)
  end
end
