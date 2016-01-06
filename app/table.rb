# The Table that the Robot can cruise around on
class Table
  attr_accessor :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def coordinates_valid?(x, y)
    x >= 0 && x <= @width - 1 && y >= 0 && y <= @height - 1
  end
end
