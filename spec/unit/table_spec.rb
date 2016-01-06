require 'spec_helper'
require 'table'

describe Table do
  it 'should accept a width to be set when created' do
    expect(Table.new(10, 15).width).to eq(10)
  end

  it 'should accept a height to be set when created' do
    expect(Table.new(10, 15).height).to eq(15)
  end
end
