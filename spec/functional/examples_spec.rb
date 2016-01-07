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
end
