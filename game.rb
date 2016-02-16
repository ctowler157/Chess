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

attr_reader :board, :display, :players

  def initialize
    @board = Board.new
    @display = Display.new(board)
    @players = [Player.new(display, :light_white, "White"),
      Player.new(display, :black, "Black")]
  end

  def run
    until board.game_over?
      begin
        display.message = "#{players[0].name}'s turn \n"
        display.render
        end_pos = nil
        until end_pos
          start_pos = pick_piece
          end_pos = players[0].move
        end
        board.move(start_pos, end_pos)
        display.selected_pos_reset
        display.render
      rescue ChessError => e
        puts e.message
        STDIN.echo = false
        STDIN.raw!
        sleep(3)
        STDIN.echo = true
        STDIN.cooked!
        display.selected_pos_reset
        retry
      end
      players.rotate!
      if board.in_check?(players[0].color)
        display.warning = "#{players[0].name} is in Check!!!!!"
      else
        display.warning = " \n"
      end
    end
    display.warning = "Checkmate! #{players[1].name} wins!"
    display.render
  end

  def pick_piece
    selected = players[0].move
    unless board[selected].color == players[0].color
      raise ChessError.new("Can't move opponent's piece!")
    end

    display.selected_pos(selected)
    selected
  end


end



if __FILE__ == $0
  game = Game.new
  game.run
end
