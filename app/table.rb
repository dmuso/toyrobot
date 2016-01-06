# The Table that the Robot can cruise around on
class Table
  attr_accessor :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end
end
