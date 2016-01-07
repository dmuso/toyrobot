require 'spec_helper'
require 'controller'

describe Controller do
  context 'on valid input' do
    it 'parses PLACE commands' do
      controller = Controller.new
      controller.parse('PLACE 0,0,NORTH')
      expect(controller.robot.report).to eq('0,0,NORTH')
    end

    it 'parses MOVE commands' do
      controller = Controller.new
      controller.parse('PLACE 0,0,NORTH')
      controller.parse('MOVE')
      expect(controller.robot.report).to eq('0,1,NORTH')
    end

    it 'parses LEFT commands' do
      controller = Controller.new
      controller.parse('PLACE 0,0,NORTH')
      controller.parse('LEFT')
      expect(controller.robot.report).to eq('0,0,WEST')
    end

    it 'parses RIGHT commands' do
      controller = Controller.new
      controller.parse('PLACE 0,0,NORTH')
      controller.parse('RIGHT')
      expect(controller.robot.report).to eq('0,0,EAST')
    end
  end

  context 'on invalid input' do
    it 'raises an error on an invalid command' do
      controller = Controller.new
      expect { controller.parse('BADROBOT') }.to raise_error(Controller::InvalidCommand)
    end

    it 'raises an error on invalid PLACE arguments' do
      controller = Controller.new
      expect { controller.parse('PLACE x') }.to raise_error(Controller::InvalidCommand)
    end
  end
end
