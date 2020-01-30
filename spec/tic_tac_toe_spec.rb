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

    it 'Can change to player X' do
        @board.set_board
        expect { @board.change_player }.to output("X's turn\n").to_stdout
    end

    it 'Starts with player O' do
        expect(@board.current_player).to eq 'O'
    end

    it 'Ends with player X' do
        allow(@board).to receive(:gets).and_return('1')
        allow(@board).to receive(:gets).and_return('2')
        allow(@board).to receive(:gets).and_return('3')
        allow(@board).to receive(:gets).and_return('4')
        allow(@board).to receive(:gets).and_return('5')
        allow(@board).to receive(:gets).and_return('6')
        allow(@board).to receive(:gets).and_return('7')
        allow(@board).to receive(:gets).and_return('8')
        allow(@board).to receive(:gets).and_return('9')
        expect(@board.current_player).to eq 'O'
    end

    it 'Checks for a winner' do
        @board.set_board
        @board.check_for_winner
        expect(@board.winner).to be(false)
    end
end
