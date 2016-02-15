require_relative 'board.rb'
require_relative 'display.rb'
require_relative 'rook.rb'

class Game

attr_reader :board, :display

  def initialize
    @board = Board.new
    green_piece = Rook.new(:green,[0, 0], board)
    magenta_piece = Piece.new(:magenta, [0, 1], board)
    board[[0, 0]] = green_piece
  #  board[[0, 1]] = green_piece
    board[[0, 1]] = magenta_piece
  #  board[[0, 3]] = magenta_piece

    @display = Display.new(board)
  end

  def run
    result = nil
    until result
      @display.render
      result = @display.get_input
    end
    result
  end

end

if __FILE__ == $0
  game = Game.new
  game.run
  p game.board[[0, 0]].moves
end
