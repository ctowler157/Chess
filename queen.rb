require_relative 'sliding_pieces'

class Queen < SlidingPieces
  DELTAS = [
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1],
    [1, 1],
    [-1, -1],
    [-1, 1],
    [1, -1]
  ]

  def deltas
    DELTAS
  end

  def to_s
    " ♛ "
  end

end
