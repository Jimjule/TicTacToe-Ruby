require 'tic_tac_toe'

describe Board do
    it 'Ends with player X' do
        board = Board.new
        allow(board).to receive(:gets).and_return('1', '2', '3', '4', '6', '5', '7', '9', '8')
        board.go
        expect(board.current_player).to eq 'X'
    end
end