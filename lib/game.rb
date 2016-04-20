require_relative 'board.rb'
require_relative 'display.rb'
require_relative './pieces/rook.rb'
require_relative './pieces/bishop.rb'
require_relative './pieces/queen.rb'
require_relative './pieces/king.rb'
require_relative './pieces/knight.rb'
require_relative './pieces/pawn.rb'
require_relative 'player.rb'
require_relative 'computer_player.rb'

class Game

  attr_reader :board, :display, :players

  def initialize
    @board = Board.new
    @display = Display.new(board)

    display.title_screen

    input = nil

    until %w(1 2).include?(input)
      puts "How many players? 1 or 2"
      input = gets.chomp.upcase
    end

    setup_board(input.to_i)
  end

  def pick_piece
    selected = players[0].move(nil)

    unless board[selected].color == players[0].color
      if board[selected].color == :white
        raise ChessError.new("There's no piece there!")
      else
        raise ChessError.new("Can't move opponent's piece!")
      end
    end

    display.selected_pos(selected)
    selected
  end

  def run
    until board.game_over?
      begin
        display.message = "#{players[0].name}'s turn \n"
        display.render
        end_pos = nil
        until end_pos
          start_pos = pick_piece
          end_pos = players[0].move(start_pos)
        end
        board.move(start_pos, end_pos)
        display.selected_pos_reset
        display.render
      rescue ChessError => e
        puts e.message
        STDIN.echo = false
        STDIN.raw!
        sleep(2)
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

  def setup_board(num_players)
    if (num_players == 1)
      @players = [ComputerPlayer.new(board, display, :light_white, "White"),
        Player.new(display, :black, "Black")]
      else
        @players = [Player.new(display, :light_white, "White"),
          Player.new(display, :black, "Black")]
        end

        run
      end

end
