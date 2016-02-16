class Pawn < Piece

attr_reader :first_move

  def initialize(color, position, board)
    super(color, position, board)
    @first_move = true
  end



  TOP_DELTAS = [
    [1, 0],
    [2, 0],
    [1, 1],
    [1, -1]
  ]

  BOTTOM_DELTAS = [
    [-1, 0],
    [-2, 0],
    [-1, 1],
    [-1, -1]
  ]

  def deltas
    color == :green ? TOP_DELTAS : BOTTOM_DELTAS
  end

  def moves
    possible_moves = []
    deltas.each do |delta|
      new_pos = [
        position[0] + delta[0],
        position[1] + delta[1]
      ]
      if board.in_bounds?(new_pos)
        if single?(new_pos) || double?(new_pos) || diagonal?(new_pos)
          possible_moves << new_pos
        end
      end
    end

    possible_moves
  end

  def to_s
    " ♟ "
  end

  private

  def diagonal?(new_pos)
    if new_pos[1] != position[1]
      if board.piece_at?(new_pos) && board[new_pos].color == opp_color
        return true
      end
    end

    false
  end

  def double?(new_pos)
    if (new_pos[0] - position[0]).abs == 2  && first_move
      mean = (new_pos[0] + position[0]) / 2
      unless board.piece_at?(new_pos) || board.piece_at?([mean, new_pos[1]])
        return true
      end
    end

    false
  end

  def single?(new_pos)
    if position[1] == new_pos[1] && (new_pos[0] - position[0]).abs == 1
      return true unless board.piece_at?(new_pos)
    end

    false
  end

end
