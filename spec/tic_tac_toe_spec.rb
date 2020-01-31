require 'tic_tac_toe'

describe Board do
    before(:each) do
        @board = Board.new
    end

    it 'Displays a board' do
        @board.set_board
        expect { @board.view_board }.to output("-----\n|...|\n|...|\n|...|\n-----\n").to_stdout
    end

    it 'Can change to player X' do
        @board.set_board
        expect { @board.change_player }.to output("X's turn\n").to_stdout
    end

    it 'Starts with player O' do
        expect(@board.current_player).to eq 'O'
    end
end
