require_relative 'board.rb'
require_relative 'display.rb'
require_relative 'rook.rb'
require_relative 'bishop.rb'
require_relative 'queen.rb'
require_relative 'king.rb'
require_relative 'knight.rb'
require_relative 'pawn.rb'


class Game

attr_reader :board, :display

  def initialize
    @board = Board.new


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

  def get_move
    
  end

end

if __FILE__ == $0
  game = Game.new
  game.run
  game.board[[2, 5]] = Queen.new(:magenta, [2, 5], game.board)
  game.board[[1, 5]] = Queen.new(:magenta, [1, 5], game.board)
  game.display.render
  # p game.board[[2, 5]].valid_moves
  p game.board.check_mate?(:green)
end
