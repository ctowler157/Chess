class Player
  attr_reader :color, :name

  def initialize(display, color, name)
    @display = display
    @color = color
    @name = name
  end

  def move(_selected_pos)
    result = nil
    until result
      @display.render
      result = @display.get_input
    end

    result
  end

end
