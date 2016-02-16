require_relative "stepping_pieces.rb"

class Knight < SteppingPieces
  DELTAS = [
    [2, 1],
    [2, -1],
    [-2, 1],
    [-2, -1],
    [1, 2],
    [1, -2],
    [-1, 2],
    [-1, -2]
  ]

  def deltas
    DELTAS
  end

  def to_s
    " ♞ "
  end

end
