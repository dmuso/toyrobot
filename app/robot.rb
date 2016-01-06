# Represents a Toy Robot
class Robot
  attr_accessor :table, :x, :y, :direction

  def initialize(table)
    @table = table
  end

  def place(x, y, direction)
    if table.coordinates_valid?(x, y)
      @x = x
      @y = y
      @direction = direction
      true
    else
      false
    end
  end
end
