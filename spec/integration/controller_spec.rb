require 'spec_helper'
require 'controller'

describe Controller do
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
