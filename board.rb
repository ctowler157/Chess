class Board
  def initialize
    @grid = Array.new(8) { Array.new(8) }
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

  def setup_pieces
  end
end
