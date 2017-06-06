require_relative 'pieces'
require 'byebug'

class Board
  attr_reader :rows

  def initialize
    @rows = Array.new(8, :x) { Array.new(8, :y) }
  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @rows[row][col] = piece
  end

  def move_piece(start_pos, end_pos)
    raise if self[start_pos].nil?

    piece = self[start_pos]
    self[end_pos] = piece
    piece.pos = end_pos
  end

end
