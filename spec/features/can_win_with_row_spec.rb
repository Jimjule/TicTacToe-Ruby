require 'tic_tac_toe'

describe Board do
    it 'Can win a row' do
        board = Board.new
        allow(board).to receive(:gets).and_return('9', '1', '7', '2', '6', '3', '4', '5', '8')
        board.go
        expect(board.winner).to be true
        expect { board.go }.to output("O is the winner!").to_stdout
    end
end