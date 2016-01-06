require 'spec_helper'
require 'robot'

describe Robot do
  it 'should be a robot' do
    expect(Robot.new.whoami).to eq("A Robot!")
  end
end
