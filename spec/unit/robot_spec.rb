require 'spec_helper'
require 'robot'
require 'table'
require 'position'

describe Robot do
  let(:robot) { Robot.new(Table.new(5, 5)) }

  describe '#place' do
    it 'can be placed on a table with table coordinates' do
      expect(robot.place(Position.new(0, 0), :north)).to eq(true)
    end

    it 'cannot be placed on a table with invalid coordinates' do
      expect(robot.place(Position.new(100, 100), :north)).to eq(false)
    end
  end

  describe '#move' do
    context 'when valid' do
      it 'can move north' do
        robot.place(Position.new(0, 0), :north)
        expect(robot.move).to eq(true)
        expect(robot.position.x).to eq(0)
        expect(robot.position.y).to eq(1)
      end

      it 'can move south' do
        robot.place(Position.new(0, 4), :south)
        expect(robot.move).to eq(true)
        expect(robot.position.x).to eq(0)
        expect(robot.position.y).to eq(3)
      end

      it 'can move east' do
        robot.place(Position.new(0, 0), :east)
        expect(robot.move).to eq(true)
        expect(robot.position.x).to eq(1)
        expect(robot.position.y).to eq(0)
      end

      it 'can move west' do
        robot.place(Position.new(4, 0), :west)
        expect(robot.move).to eq(true)
        expect(robot.position.x).to eq(3)
        expect(robot.position.y).to eq(0)
      end
    end

    context 'when invalid' do
      it 'do not move if move is invalid' do
        robot.place(Position.new(0, 0), :south)
        expect(robot.move).to eq(false)
        expect(robot.position.x).to eq(0)
        expect(robot.position.y).to eq(0)
      end
    end
  end
end
