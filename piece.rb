class Piece
  attr_reader :color, :position, :board
  def initialize(color, position, board)
    @color = color
    @position = position
    @board = board
  end

  def opp_color
    color == :green ? :magenta : :green
  end

  def present?
    true
  end

  def to_s
    " P "
  end

  def inspect
    { "color" => color, "position" => position, "piece" => self.class }
  end

  def moves
    raise "Calling #moves on Piece superclass"
  end

  def valid_moves
    valid_moves_arr = []

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
