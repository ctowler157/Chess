require 'colorize'
require_relative 'board.rb'
require 'byebug'
require_relative 'cursorable.rb'

class Display
  include Cursorable
  attr_reader :board
  def initialize(board)
    @board = board
    @cursor_pos = [0, 0]
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

  def colors_for(i , j)
    if [i, j] == @cursor_pos
      bg = :light_blue
    elsif (i.even? && j.even?) || (i.odd? && j.odd?)
      bg = :white
    else
      bg = :black
    end
    piece = board[[i, j]]
    { background: bg, color: piece.color }
  end

  def render
    system("clear")
    build_grid.each {|row| puts row.join}
  end

end
