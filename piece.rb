class Piece
  attr_reader :color
  def initialize(color)
    @color = color
  end

  def to_s
    " P "
  end

  def moves
    raise "Calling #moves on Piece superclass"
  end
end

class NullPiece

  def present?
    false
  end

  def to_s
    "   "
  end

  def color
    :white
  end

  def moves
    raise "Calling #moves on NullPiece"
  end

end
