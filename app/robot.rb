# Represents a Toy Robot
class Robot
  attr_accessor :table, :position, :direction

  def initialize(table)
    @table = table
  end

  def place(position, direction)
    if table.position_valid?(position)
      @position = position
      @direction = direction
      true
    else
      false
    end
  end

  def move
    new_position = move_based_on_direction(@position, @direction)
    if table.position_valid?(new_position)
      @position = new_position
      true
    else
      false
    end
  end

  def turn_left
    @direction = @direction.left
  end

  private

  def move_based_on_direction(current_position, direction)
    if [:north, :south].include?(direction.to_sym)
      move_y(current_position, direction)
    else
      move_x(current_position, direction)
    end
  end

  def move_y(current_position, direction)
    case direction.to_sym
    when :north then Position.new(current_position.x, current_position.y + 1)
    when :south then Position.new(current_position.x, current_position.y - 1)
    end
  end

  def move_x(current_position, direction)
    case direction.to_sym
    when :east then Position.new(current_position.x + 1, current_position.y)
    when :west then Position.new(current_position.x - 1, current_position.y)
    end
  end
end
