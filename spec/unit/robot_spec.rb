require 'spec_helper'
require 'robot'
require 'table'
require 'position'

describe Robot do
  let(:robot) { Robot.new(Table.new(5, 5)) }

  describe '#place' do
    let(:direction) { double(Direction) }

    it 'can be placed on a table with table coordinates' do
      expect(robot.place(Position.new(0, 0), direction)).to eq(true)
    end

    it 'cannot be placed on a table with invalid coordinates' do
      expect(robot.place(Position.new(100, 100), direction)).to eq(false)
    end
  end

  describe '#move' do
    context 'when valid' do
      it 'can move north' do
        robot.place(Position.new(0, 0), Direction.new(:north))
        expect(robot.move).to eq(true)
        expect(robot.position.x).to eq(0)
        expect(robot.position.y).to eq(1)
      end

      it 'can move south' do
        robot.place(Position.new(0, 4), Direction.new(:south))
        expect(robot.move).to eq(true)
        expect(robot.position.x).to eq(0)
        expect(robot.position.y).to eq(3)
      end

      it 'can move east' do
        robot.place(Position.new(0, 0), Direction.new(:east))
        expect(robot.move).to eq(true)
        expect(robot.position.x).to eq(1)
        expect(robot.position.y).to eq(0)
      end

      it 'can move west' do
        robot.place(Position.new(4, 0), Direction.new(:west))
        expect(robot.move).to eq(true)
        expect(robot.position.x).to eq(3)
        expect(robot.position.y).to eq(0)
      end
    end

    context 'when invalid' do
      it 'do not move if move is invalid' do
        robot.place(Position.new(0, 0), Direction.new(:south))
        expect(robot.move).to eq(false)
        expect(robot.position.x).to eq(0)
        expect(robot.position.y).to eq(0)
      end
    end
  end

  describe '#turn_left' do
    it 'from north it turns to face west' do
      robot.place(Position.new(0, 0), Direction.new(:north))
      robot.turn_left
      expect(robot.direction.to_sym).to eq(:west)
    end
  end

  describe '#turn_right' do
    it 'from west it turns to face north' do
      robot.place(Position.new(0, 0), Direction.new(:west))
      robot.turn_right
      expect(robot.direction.to_sym).to eq(:north)
    end
  end
end
