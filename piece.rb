class Piece
  attr_reader :color
  def initialize(color)
    @color = color
  end

  def to_s
    "P"
  end
end
