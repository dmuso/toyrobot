require 'spec_helper'
require 'direction'

describe Direction do
  describe '#initialize' do
    it 'accepts a valid direction' do
      expect(Direction.new(:north).to_sym).to eq(:north)
    end

    it 'raises an error when direction argument is invalid' do
      expect do
        Direction.new(:invalid)
      end.to raise_error(Direction::InvalidDirection)
    end
  end
end
