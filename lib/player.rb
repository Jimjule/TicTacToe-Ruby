# frozen_string_literal: true

class Player
  attr_reader(:current_player)

  def initialize
    @current_player = 'O'
  end

  def change_player
    @current_player == 'X' ? @current_player = 'O' : @current_player = 'X'
    puts "#{@current_player}'s turn"
  end
end
