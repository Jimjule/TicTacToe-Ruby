class Board
    BOARD_ROW = '-'
    BOARD_COLUMM = '|'
    BEGINNING_AND_END_LENGTH = 2

    def initialize(board_size = 3)
        @board = []
        @board_top_and_bottom = []
        @board_middle = []
        @board_middle_section = []
        @board_size = board_size
    end

    def go
        set_board
        player_move
    end

    def set_board
        set_board_top_and_bottom
        set_board_middle
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
        @board_size.times do
            @board_middle << [@board_middle_section.join]
        end
    end

    def reset_middle_section
        @board_middle_section = []
    end

    def add_board_spaces
        @board_size.times do 
            @board_middle_section.push('.')    
        end
    end

    def add_board_edge
        @board_middle_section << BOARD_COLUMM
    end

    def assemble_board
        @board << @board_top_and_bottom
        @board << @board_middle
        @board << @board_top_and_bottom
    end

    def view_board
        system('clear')
        reset_board
        assemble_board
        puts @board
    end

    def reset_board
        @board = []
    end

    def player_move
        player_input = -1
        while player_input < 1 || player_input > 9 do
            puts 'Please enter a number between 1-9'
            player_input = gets.chomp.to_i
        end
        make_move(player_input)
        view_board
    end

    def make_move(square)
        puts 'Making move'
        @board_middle[(square - 1) / 3] = @board_middle[(square - 1) / 3].join.split('')
        @board_middle[(square - 1) / 3][(square - 1) % 3 + 1] = 'X'
        @board_middle[(square - 1) / 3] = @board_middle[(square - 1) / 3].join
    end
end
