require 'tic_tac_toe'

describe Board do
    it 'Can win diagonally' do
        board = Board.new
        allow(board).to receive(:gets).and_return('9', '2', '5', '3', '1', '4', '6', '7', '8')
        board.go
        expect(board.winner).to be true
    end
end