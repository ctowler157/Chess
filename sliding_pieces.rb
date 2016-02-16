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
      new_pos = [
        position[0] + delta[0],
        position[1] + delta[1]
      ]
      while board.in_bounds?(new_pos)
        if board.piece_at?(new_pos)
          unless board[new_pos].color == color
            possible_moves << new_pos
          end
          break
        end
        #push position in moves if opposite color
        possible_moves << new_pos
        new_pos = [
          new_pos[0] + delta[0],
          new_pos[1] + delta[1]
        ]
      end
    end
    possible_moves
  end

end
