require_relative 'pieces'
require_relative 'nullpiece'

require 'byebug'

class Board
  attr_accessor :rows

  def initialize
    @rows = Array.new(8) { Array.new(8) }
    place_piece
  end

  def place_piece
    piece_place = [0, 1, 6, 7]
    @rows.each_with_index do |arr, row|
      arr.each_index do |col|
        if piece_place.include?(row)
          @rows[row][col] = Piece.new
        else
          @rows[row][col] = Nullpiece.new
        end
      end
    end
  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @rows[row][col] = piece
  end

  def add_piece(piece, pos)
    self[pos] = piece
  end

  def move_piece(start_pos, end_pos)
    raise if self[start_pos].nil?
    raise unless self[end_pos].nil?

    piece = self[start_pos]
    self[start_pos] = Nullpiece.new
    self[end_pos] = piece
  end

  def in_bounds?(pos)
    pos.all? { |val| val.between?(0,7) }
  end

end
