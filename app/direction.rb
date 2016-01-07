# Directions that a robot can face
class Direction
  class InvalidDirection < ArgumentError; end

  attr_accessor :name

  DIRECTIONS = [:north, :south, :east, :west]

  def initialize(name)
    if DIRECTIONS.include?(name)
      @name = name
    else
      fail(InvalidDirection, "Direction '#{name}' invalid,
        valid directions must be one of #{DIRECTIONS}.")
    end
  end

  def to_sym
    @name
  end

  def left
    Direction.new(DIRECTIONS[DIRECTIONS.index(@name) - 1])
  end
end
