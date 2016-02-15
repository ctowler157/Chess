require_relative 'piece.rb'
require_relative 'display.rb'

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.new } }
    setup_pieces
  end

  def [](position)
    row, col = position
    @grid[row][col]
  end

  def []=(position, value)
    row, col = position
    @grid[row][col] = value
  end

  def in_bounds?(position)
    position.all? { |el| el.between?(0, 7)}
  end

  def move(start_pos, end_pos)
    if self[start_pos].nil?
      raise ChessError.new("No piece at start location")
    elsif !valid_move?(start_pos, end_pos)
      raise ChessError.new("Piece selected can't move there")
    end
    self[end_pos] = self[start_pos]
    self[start_pos] = nil
  end

  def setup_pieces
  end

  def valid_move?(start_pos, end_pos)
    true
  end

end

class ChessError < StandardError
end

if __FILE__ == $0

  # board[[0, 0]] = piece
  # board.move([0, 0], [0, 1])
  # p board[[0, 1]]
  # board.move([0, 0], [0, 1])
end
