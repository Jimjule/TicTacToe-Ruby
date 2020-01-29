require 'tic_tac_toe'

describe Board do
    it "Displays a board" do
        board = Board.new
        expect(board.view_board).to eq([['-----'],['|   |'],['|   |'],['|   |'],['-----']])
    end
end