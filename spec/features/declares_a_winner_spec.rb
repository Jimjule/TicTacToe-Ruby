require 'tic_tac_toe'

describe Board do
    it 'Declares X is the winner' do
        board = Board.new
        allow(board).to receive(:gets).and_return('1', '2', '4', '5', '7', '8', '3', '6', '9')
        expect { board.go }.to output('X is the winner!').to_stdout 
    end
end