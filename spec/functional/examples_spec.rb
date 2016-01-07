require 'spec_helper.rb'
require 'controller'

describe 'Examples' do
  it 'Example A should report 0,1,NORTH' do
    file = File.open('./spec/fixtures/example_a.txt')
    controller = Controller.new
    file.readlines.each do |line|
      controller.parse(line)
    end
    expect(controller.robot.report).to eq('0,1,NORTH')
  end

  it 'Example B should report 0,0,WEST' do
    file = File.open('./spec/fixtures/example_b.txt')
    controller = Controller.new
    file.readlines.each do |line|
      controller.parse(line)
    end
    expect(controller.robot.report).to eq('0,0,WEST')
  end

  it 'Example C should report 3,3,NORTH' do
    file = File.open('./spec/fixtures/example_c.txt')
    controller = Controller.new
    file.readlines.each do |line|
      controller.parse(line)
    end
    expect(controller.robot.report).to eq('3,3,NORTH')
  end

  it 'Example D should report 4,4,NORTH' do
    file = File.open('./spec/fixtures/example_d.txt')
    controller = Controller.new
    file.readlines.each do |line|
      controller.parse(line)
    end
    expect(controller.robot.report).to eq('4,4,NORTH')
  end
end
