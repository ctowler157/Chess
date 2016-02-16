require 'colorize'
require_relative 'board.rb'
require 'byebug'
require_relative 'cursorable.rb'

class Display
  include Cursorable
  attr_reader :board
  attr_accessor :message, :warning

  def initialize(board)
    @board = board
    @cursor_pos = [0, 0]
    @message = " \n"
    @warning = " \n"
    @selected_pos = nil
  end

  def build_grid
    board.grid.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end

  def selected_pos(pos)
    @selected_pos = pos
  end

  def selected_pos_reset
    @selected_pos = nil
  end

  def colors_for(i , j)
    if [i, j] == @selected_pos
      bg = :light_red
    elsif [i, j] == @cursor_pos
      bg = :light_blue
    elsif (i.even? && j.even?) || (i.odd? && j.odd?)
      bg = :white
    else
      bg = :light_black
    end
    piece = board[[i, j]]
    { background: bg, color: piece.color }
  end

  def render
    system("clear")
    puts message
    build_grid.each {|row| puts row.join}
    puts warning
  end

end
