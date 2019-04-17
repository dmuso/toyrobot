# frozen_string_literal: true

require_relative 'robot'
require_relative 'table'
require_relative 'position'
require_relative 'direction'

# Control a robot to do your bidding
class Controller
  class InvalidCommand < ArgumentError; end

  attr_accessor :robot

  def initialize
    @robot = Robot.new(Table.new(5, 5))
  end

  def parse(command_string)
    command, args = parse_args(command_string)
    case command
    when 'PLACE' then @robot.place(*place_args(args))
    when 'MOVE'  then @robot.move
    when 'LEFT'  then @robot.turn_left
    when 'RIGHT' then @robot.turn_right
    when 'REPORT' then nil
    else
      raise InvalidCommand, 'Invalid robot command.'
    end
  end

  private

  def parse_args(command_string)
    command, args = command_string.upcase.chomp.split(' ')
    args = args.split(',') if args
    [command, args]
  end

  def place_args(args)
    [
      Position.new(args[0].to_i, args[1].to_i),
      Direction.new(args[2].downcase.to_sym)
    ]
  rescue
    raise InvalidCommand, 'Invalid arguments given to PLACE command.'
  end
end
