require 'board'

# frozen_string_literal: true

describe Board do
  it 'Displays a board' do
    expect { Board.new }.to output("-----\n|...|\n|...|\n|...|\n-----\n").to_stdout
  end

  it 'Makes a move' do
    board = Board.new
    allow(board).to receive(:gets).and_return('2', '1')
    board.player_move('X')
    board.player_move('O')
    expect(board.board_middle[0]).to eq('OX.')
  end
end
