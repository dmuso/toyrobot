# Represents a Toy Robot
class Robot
  class RobotNotPlaced < StandardError; end

  attr_accessor :table, :position, :direction

  def initialize(table)
    @table = table
    @placed = false
  end

  def place(position, direction)
    if table.position_valid?(position)
      @position = position
      @direction = direction
      @placed = true
      true
    else
      false
    end
  end

  def move
    fail(RobotNotPlaced, 'Your robot has not been placed yet') unless placed?
    new_position = move_based_on_direction(@position, @direction)
    if table.position_valid?(new_position)
      @position = new_position
      true
    else
      false
    end
  end

  def turn_left
    fail(RobotNotPlaced, 'Your robot has not been placed yet') unless placed?
    @direction = @direction.left
  end

  def turn_right
    fail(RobotNotPlaced, 'Your robot has not been placed yet') unless placed?
    @direction = @direction.right
  end

  def report
    fail(RobotNotPlaced, 'Your robot has not been placed yet') unless placed?
    "#{@position.x},#{@position.y},#{@direction.to_s.upcase}"
  end

  def placed?
    @placed == true
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
