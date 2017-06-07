require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  attr_reader :cursor
  def initialize(board = Board.new)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def play
    while true
      system("clear")
      self.render
      @cursor.get_input
    end
  end

  def render
     @board.rows.each_with_index do |row, i|
      row.each_with_index do |piece, j|
        if @cursor.cursor_pos == [i, j]
          print piece.to_s.colorize(background: :blue)
        else
          print piece
        end
      end
      puts
    end
    nil
  end
end
