require 'tic_tac_toe'

describe Board do
    before(:each) do
        @board = Board.new
    end

    it 'Displays a board' do
        @board.set_board
        expect { @board.view_board }.to output("-----\n|...|\n|...|\n|...|\n-----\n").to_stdout
    end

    it 'Marks the board at square 1' do
        allow(@board).to receive(:gets).and_return('1')
        @board.go
        expect { @board.view_board }.to output("-----\n|X..|\n|...|\n|...|\n-----\n").to_stdout
    end

    it 'Marks the board at square 5' do
        allow(@board).to receive(:gets).and_return('5')
        @board.go
        expect { @board.view_board }.to output("-----\n|...|\n|.X.|\n|...|\n-----\n").to_stdout
    end

    it 'Does not accept input not between 1-9' do
        allow(@board).to receive(:gets).and_return('0')
        allow(@board).to receive(:gets).and_return('7')
        @board.go
        expect { @board.view_board }.to output("-----\n|...|\n|...|\n|X..|\n-----\n").to_stdout
    end
end
