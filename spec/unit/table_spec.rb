require 'spec_helper'
require 'table'

describe Table do
  it 'accepts a width to be set when created' do
    expect(Table.new(10, 15).width).to eq(10)
  end

  it 'accepts a height to be set when created' do
    expect(Table.new(10, 15).height).to eq(15)
  end

  describe '#coordinates_valid?' do
    context 'invalid x' do
      it 'less than zero' do
        table = Table.new(5, 5)
        expect(table.coordinates_valid?(-1, 0)).to eq(false)
      end

      it 'greater than width' do
        table = Table.new(5, 5)
        expect(table.coordinates_valid?(5, 0)).to eq(false)
      end
    end

    context 'invalid y' do
      it 'less than zero' do
        table = Table.new(5, 5)
        expect(table.coordinates_valid?(0, -1)).to eq(false)
      end

      it 'greater than height' do
        table = Table.new(5, 5)
        expect(table.coordinates_valid?(0, 5)).to eq(false)
      end
    end
  end
end
