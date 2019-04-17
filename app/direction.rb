# frozen_string_literal: true

# Directions that a robot can face
class Direction
  class InvalidDirection < ArgumentError; end

  attr_accessor :name

  DIRECTIONS = %i[north east south west].freeze

  def initialize(name)
    if DIRECTIONS.include?(name)
      @name = name
    else
      raise InvalidDirection, "Direction '#{name}' invalid, \
valid directions must be one of #{DIRECTIONS}."
    end
  end

  def to_sym
    @name
  end

  def to_s
    @name.to_s
  end

  def left
    Direction.new(DIRECTIONS[DIRECTIONS.index(@name) - 1])
  end

  def right
    index = DIRECTIONS.index(@name) + 1
    index = 0 if index >= DIRECTIONS.length - 1
    Direction.new(DIRECTIONS[index])
  end
end
