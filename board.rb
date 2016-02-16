require_relative 'piece.rb'
require_relative 'display.rb'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.new } }
    setup_pieces
  end

  def [](position)
    row, col = position
    @grid[row][col]
  end

  def []=(position, value)
    row, col = position
    @grid[row][col] = value
    grid[row][col].position = position
  end

  def check_mate?(color)
    return false unless in_check?(color)

    pieces_of_color(color).each do |piece|
      unless piece.valid_moves.empty?
        return false
      end
    end


    true
  end

  def in_bounds?(position)
    position.all? { |el| el.between?(0, 7)}
  end

  def in_check?(color)
    king_pos = king_of_color(color).position
    opposite_color = color == :black ? :light_white : :black
    pieces_of_color(opposite_color).each do |piece|
      piece.moves.each do |position|
        return true if position == king_pos
      end
    end

    false
  end

  def move(start_pos, end_pos)
    unless piece_at?(start_pos)
      raise ChessError.new("No piece at selected location")
    end
    unless self[start_pos].valid_moves.include?(end_pos)
      raise ChessError.new("Piece selected can't move there")
    end
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.new
    if self[end_pos].class == Pawn
      self[end_pos].first_move = false
      promote(end_pos) if self[end_pos].promoted?
    end

  end

  def piece_at?(position)
    self[position].present?
  end

  def pieces_of_color(color)
    pieces = []
    grid.each do |row|
      row.each do |piece|
        pieces << piece if piece.color == color
      end
    end

    pieces
  end
  def inspect
    self[[1, 5]].inspect
  end
  def king_of_color(color)
    pieces_of_color(color).select { |piece| piece.class == King }[0]
  end

  def promote(pos)
    puts "Promote Pawn: Q or K or B or R"
    input = gets.chomp.upcase
    case input
    when "K"
      self[pos] = Knight.new(self[pos].color, pos, self)
    when "Q", "R", "B"
      self[pos] = Queen.new(self[pos].color, pos, self)
    end
  end

  def dup
    new_board = Board.new
    new_board.grid = grid.deep_dup
    new_board.assign_board
    new_board
  end

  def assign_board
    grid.each do |row|
      row.each do |piece|
        piece.board = self
      end
    end
  end

  def game_over?
    check_mate?(:black) || check_mate?(:light_white)
  end

  private
  def setup_pieces
    setup_pawns
    setup_knights
    setup_queens
    setup_kings
    setup_bishops
    setup_rooks
  end





  def setup_pawns
    @grid[1].each_index { |idx| self[[1, idx]] = Pawn.new(
      :black, [1, idx], self) }
    @grid[6].each_index { |idx| self[[6, idx]] = Pawn.new(
        :light_white, [6, idx], self) }
  end

  def setup_knights
    self[[0, 1]] = Knight.new(:black, [0, 1], self)
    self[[0, 6]] = Knight.new(:black, [0, 6], self)
    self[[7, 1]] = Knight.new(:light_white, [7, 1], self)
    self[[7, 6]] = Knight.new(:light_white, [7, 6], self)
  end

  def setup_rooks
    self[[0, 0]] = Rook.new(:black, [0, 0], self)
    self[[0, 7]] = Rook.new(:black, [0, 7], self)
    self[[7, 0]] = Rook.new(:light_white, [7, 0], self)
    self[[7, 7]] = Rook.new(:light_white, [7, 7], self)
  end

  def setup_bishops
    self[[0, 2]] = Bishop.new(:black, [0, 2], self)
    self[[0, 5]] = Bishop.new(:black, [0, 5], self)
    self[[7, 2]] = Bishop.new(:light_white, [7, 2], self)
    self[[7, 5]] = Bishop.new(:light_white, [7, 5], self)
  end

  def setup_queens
    self[[0, 3]] = Queen.new(:black, [0, 3], self)
    self[[7, 3]] = Queen.new(:light_white, [7, 3], self)
  end

  def setup_kings

    self[[0, 4]] = King.new(:black, [0, 4], self)
    self[[7, 4]] = King.new(:light_white, [7, 4], self)
  end



end


class Array
  def deep_dup
    new_array = []
    self.each do |el|
      new_array << (el.is_a?(Array) ? el.deep_dup : el.dup)
    end
    new_array
  end
end


class ChessError < StandardError
end

if __FILE__ == $0

  # board[[0, 0]] = piece
  # board.move([0, 0], [0, 1])
  # p board[[0, 1]]
  # board.move([0, 0], [0, 1])
end
