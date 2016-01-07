# Control a robot from a file or command line
class Controller
  attr_accessor :robot

  def initialize
    @robot = Robot.new(Table.new(5, 5))
  end

  def parse(command_string)
    command, args = parse_args(command_string)
    case command
    when 'PLACE'
      @robot.place(
        Position.new(args[0].to_i, args[1].to_i),
        Direction.new(args[2].downcase.to_sym))
    when 'MOVE'
      @robot.move
    end
  end

  private

  def parse_args(command_string)
    command, args = command_string.upcase.chomp.split(' ')
    args = args.split(',') if args
    [command, args]
  end
end
