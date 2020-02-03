require_relative 'board'

class Player
    attr_reader( :current_player, :square, :board, :winner)

    def initialize(board_size = 3, board = Board.new(board_size))
        @board = board
        @current_player = 'O'
        @winner = false
        @square # Remove once make_move has better test
    end

    def change_player
        @current_player == 'X' ? @current_player = 'O' : @current_player = 'X'
        puts "#{@current_player}'s turn"
    end

    def view_board
        puts 'Here'
        @board.view_board
    end

    def go
        while @board.turn_count < @board.max_turns do
            change_player
            @board.player_move(@current_player)
            check_for_winner
            @board.increment_turn_count
        end
        puts 'Draw!' if @winner == false
    end

    def store_player_move(square)
        @board.store_player_move(square)
    end

    def check_for_winner
        if @board.check_for_winner(@current_player)
            puts "#{@current_player} is the winner!"
            exit
        end
    end
end
