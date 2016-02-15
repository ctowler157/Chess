require_relative 'piece.rb'
require 'byebug'

class SlidingPieces < Piece

  DELTAS = [

  ]

  def deltas
    DELTAS
  end

  def moves
    possible_moves = []
    deltas.each do |delta|
      new_row, new_col = position
      new_row += delta.first
      new_col += delta.last
      while board.in_bounds?([new_row, new_col])
        break if board.piece_at?([new_row, new_col])
        possible_moves << [new_row, new_col]
        new_row += delta.first
        new_col += delta.last
      end
    end
    possible_moves
  end

end
