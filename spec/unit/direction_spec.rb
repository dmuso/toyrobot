require 'spec_helper'
require 'direction'

describe Direction do
  describe '#initialize' do
    it 'accepts a valid direction' do
      expect(Direction.new(:north).to_sym).to eq(:north)
    end

    it 'raises an error when direction argument is invalid' do
      expect { Direction.new(:invalid) }.to raise_error(Direction::InvalidDirection)
    end
  end

  describe '#left' do
    it 'west is left of north' do
      direction = Direction.new(:north)
      expect(direction.left.to_sym).to eq(:west)
    end
  end

  describe '#right' do
    it 'north is right of west' do
      direction = Direction.new(:west)
      expect(direction.right.to_sym).to eq(:north)
    end
  end
end
