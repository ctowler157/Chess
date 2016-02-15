require_relative 'board.rb'
require_relative 'display.rb'

class Game

attr_reader :board, :display

  def initialize
    @board = Board.new
    green_piece = Piece.new(:green)
    magenta_piece = Piece.new(:magenta)
    board[[0, 0]] = green_piece
    board[[0, 1]] = green_piece
    board[[0, 2]] = magenta_piece
    board[[0, 3]] = magenta_piece

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
end
