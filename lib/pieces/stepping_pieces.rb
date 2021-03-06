class SteppingPieces < Piece

  DELTAS = []

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

      if board.in_bounds?(new_pos)
        if board.piece_at?(new_pos)
          unless board[new_pos].color == color
            possible_moves << new_pos
          end
        else
          possible_moves << new_pos
        end
      end
    end

    possible_moves
  end

end
