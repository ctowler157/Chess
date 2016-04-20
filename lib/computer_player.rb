class ComputerPlayer < Player
  attr_reader :color, :name, :board

  def initialize(board, display, color, name)
    @board = board
    @display = display
    @color = color
    @name = name
  end

  def move(selected_pos)
    if selected_pos
      position = board[selected_pos].valid_moves.sample
    else
      pieces = board.pieces_of_color(color)

      target_piece = nil
      until target_piece
        piece = pieces.sample
        target_piece = piece if piece.valid_moves.length > 0
      end

      position = target_piece.position
    end

    position
  end

end
