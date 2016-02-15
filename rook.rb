require_relative 'sliding_pieces.rb'
class Rook < SlidingPieces
  DELTAS = [
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1]
  ]
  
  def deltas
    DELTAS
  end

  def to_s
    " R "
  end
end
