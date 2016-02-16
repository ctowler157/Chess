require_relative 'board.rb'
require_relative 'display.rb'
require_relative 'rook.rb'
require_relative 'bishop.rb'
require_relative 'queen.rb'
require_relative 'king.rb'
require_relative 'knight.rb'
require_relative 'pawn.rb'
require_relative 'player.rb'

class Game

attr_reader :board, :display

  def initialize
    @board = Board.new
    @display = Display.new(board)
    @player = Player.new(display)
  end

  def run
    until board.game_over?
      begin
        display.render
        end_pos = nil
        until end_pos
          start_pos = @player.move
          end_pos = @player.move
        end
        board.move(start_pos, end_pos)
        display.render
      rescue ChessError => e
        puts e.message
        STDIN.echo = false
        STDIN.raw!
        sleep(3)
        retry
      end
    end
  end


end



if __FILE__ == $0
  game = Game.new
  game.run
end
