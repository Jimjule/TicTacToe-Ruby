class Board
    BOARD_ROW = '-'
    BOARD_COLUMM = '|'
    BEGINNING_AND_END_LENGTH = 2

    def initialize(board_size = 3)
        @board = []
        @board_top_and_bottom = []
        @board_middle = []
        @board_size = board_size
    end

    def go
        set_board
    end

    def set_board
        set_board_top_and_bottom
        set_board_middle
        assemble_board
        view_board
    end

    def set_board_top_and_bottom
        (@board_size + BEGINNING_AND_END_LENGTH).times do 
            @board_top_and_bottom.push(BOARD_ROW)    
        end
        @board_top_and_bottom = [@board_top_and_bottom.join]
    end

    def set_board_middle
        add_board_edge
        add_board_spaces
        add_board_edge
        @board_middle = [@board_middle.join]
    end

    def add_board_spaces
        @board_size.times do 
            @board_middle.push('.')    
        end
    end

    def add_board_edge
        @board_middle << BOARD_COLUMM
    end

    def assemble_board
        @board << @board_top_and_bottom
        @board_size.times do
            @board << @board_middle
        end
        @board << @board_top_and_bottom
    end

    def view_board
        return @board
    end
end