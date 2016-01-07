require_relative 'controller'

# Control your robot with an interactive console!
class Repl
  def run
    trap('INT') { exit }
    controller = Controller.new
    loop do
      break unless input_handler(controller)
    end
  end

  private

  def input_handler(controller)
    command = gets.chomp.upcase
    case command
    when 'QUIT'   then return false
    when 'REPORT' then puts controller.robot.report
    else controller.parse(command)
    end
    true
  rescue Robot::RobotNotPlaced
    puts 'ERROR: Robot has not been placed yet.'
    true
  rescue Controller::InvalidCommand => e
    puts "ERROR: #{e.message}"
    true
  end
end

Repl.new.run
