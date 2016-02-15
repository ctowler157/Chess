require 'colorize'
require_relative 'board.rb'
require 'byebug'


class Display
  attr_reader :board
  def initialize(board)
    @board = board
  end

  def display_board
    space_color = :white
    board.grid.each do |row|
      row.each do |square|
        # debugger
        piece = square
        if piece.nil?
          print "   ".colorize(:background => space_color)
        else
          print " #{piece} "
          .colorize(:color => piece.color, :background => space_color)
        end

        space_color = space_color == :white ? :black : :white
      end
      print "\n"
      space_color = space_color == :white ? :black : :white
    end
  end

end
