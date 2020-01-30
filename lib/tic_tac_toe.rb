class Board

    attr_reader( :current_player, :winner )
    BOARD_ROW = '-'
    BOARD_COLUMM = '|'
    BEGINNING_AND_END_LENGTH = 2

    def initialize(board_size = 3)
        @board = []
        @xmoves = []
        @ymoves = []
        @board_top_and_bottom = []
        @board_middle = []
        @board_middle_section = []
        @board_size = board_size
        @current_player = 'O'
        @turn_count = 0
        @max_turns = board_size * board_size
        @winner = false
    end

    def go
        set_board
        while @turn_count < @max_turns do
            change_player
            player_move
            increment_turn_count
        end
        draw
    end

    def draw
    end

    def increment_turn_count
        @turn_count += 1
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
        add_board_spaces
        @board_size.times do
            @board_middle << @board_middle_section.join
        end
        i = 0
    end

    def add_board_spaces
        @board_size.times do 
            @board_middle_section.push('.')    
        end
    end

    def reset_middle_section
        @board_middle_section = []
    end

    def assemble_board
        @board << @board_top_and_bottom
        @board_middle.each do | section |
            @board << BOARD_COLUMM + section + BOARD_COLUMM
        end
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
            puts 'Please enter a free number between 1-9'
            player_input = gets.chomp.to_i
            @row = (player_input - 1) / 3
            @column = (player_input - 1) % 3
            check_square_is_free(player_input)
        end
        # check_square_is_free(player_input)
        make_move(player_input)
        view_board
    end

    def check_square_is_free(square)
        # row = (square - 1) / 3
        # column = (square - 1) % 3
        @board_middle[@row] = @board_middle[@row]
        player_input = -1 if @free_square = @board_middle[@row][@column] != '.'
    end

    def make_move(square)
        # row = (square - 1) / 3
        # column = (square - 1) % 3
        puts 'Making move'
        @board_middle[@row] = @board_middle[@row].split('')
        @board_middle[@row][@column] = @current_player
        @board_middle[@row] = @board_middle[@row].join
    end

    def change_player
        @current_player == 'X' ? @current_player = 'O' : @current_player = 'X'
        puts "#{@current_player}'s turn"
    end

    def check_for_winner
        
    end
end
