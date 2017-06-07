require_relative 'pieces'

class Nullpiece < Piece
  attr_reader :symbol
  def initialize
    @symbol = " "
  end

  def to_s
    @symbol
  end
end
