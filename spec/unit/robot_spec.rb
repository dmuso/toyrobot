require 'spec_helper'
require 'robot'

describe Robot do
  let(:robot) { Robot.new(Table.new(5, 5)) }

  it 'can be placed on a table with table coordinates' do
    expect(robot.place(0, 0, :north)).to eq(true)
  end

  it 'cannot be placed on a table with invalid coordinates' do
    expect(robot.place(100, 100, :north)).to eq(false)
  end
end
