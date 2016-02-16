require 'byebug'

class Piece
  attr_reader :color, :position, :board
  attr_writer :board, :position
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
    # debugger
    moves.each do |move|
      new_board = board.dup
      new_board[move] = new_board[position]
      new_board[position] = NullPiece.new
      valid_moves_arr << move unless new_board.in_check?(color)
    end

    valid_moves_arr
  end
end

class NullPiece

  def board=(value)
  end

  def position=(value)
  end

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
