# frozen_string_literal: true

require 'spec_helper'
require 'table'
require 'position'

describe Table do
  it 'accepts a width to be set when created' do
    expect(Table.new(10, 15).width).to eq(10)
  end

  it 'accepts a height to be set when created' do
    expect(Table.new(10, 15).height).to eq(15)
  end

  describe '#position_valid?' do
    context 'invalid x' do
      it 'less than zero' do
        table = Table.new(5, 5)
        position = Position.new(-1, 0)
        expect(table.position_valid?(position)).to eq(false)
      end

      it 'greater than width' do
        table = Table.new(5, 5)
        position = Position.new(5, 0)
        expect(table.position_valid?(position)).to eq(false)
      end
    end

    context 'invalid y' do
      it 'less than zero' do
        table = Table.new(5, 5)
        position = Position.new(0, -1)
        expect(table.position_valid?(position)).to eq(false)
      end

      it 'greater than height' do
        table = Table.new(5, 5)
        position = Position.new(0, 5)
        expect(table.position_valid?(position)).to eq(false)
      end
    end
  end
end
