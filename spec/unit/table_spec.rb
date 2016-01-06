require 'spec_helper'
require 'table'

describe Table do
  it 'should be a table' do
    expect(Table.new.whoami).to eq('A Table!')
  end

  it 'should have a default width' do
    expect(Table.new.width).to eq(5)
  end

  it 'should have a default height' do
    expect(Table.new.height).to eq(5)
  end
end
