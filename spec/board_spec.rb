require 'board'

# frozen_string_literal: true

describe Board do
  it 'Displays a board' do
    expect { Board.new }.to output("-----\n|123|\n|456|\n|789|\n-----\n").to_stdout
  end

  it 'Makes a move' do
    board = Board.new
    board.make_move('X', 0, 1)
    board.make_move('O', 0, 0)
    expect(board.board_middle[0].join).to eq('OX3')
  end
end
