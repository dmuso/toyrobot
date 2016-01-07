# The Table that the Robot can cruise around on
class Table
  attr_accessor :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def position_valid?(position)
    position.x >= 0 && position.x <= @width - 1 &&
      position.y >= 0 && position.y <= @height - 1
  end
end
