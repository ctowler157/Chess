require_relative 'sliding_pieces.rb'

class Bishop < SlidingPieces
  DELTAS = [
    [1, 1],
    [-1, -1],
    [-1, 1],
    [1, -1]
  ]

  def deltas
    DELTAS
  end

  def to_s
    " ♝ "
  end

end
