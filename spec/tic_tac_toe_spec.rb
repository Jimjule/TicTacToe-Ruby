require 'tic_tac_toe'

describe Board do
    it "Displays a board" do
        board = Board.new
        board.go
        expect { board.view_board }.to output("-----\n|...|\n|...|\n|...|\n-----\n").to_stdout
    end
end