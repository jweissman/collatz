require 'spec_helper'
require 'collatz'

describe Collatz do
  it "should have a VERSION constant" do
    expect(subject.const_get('VERSION')).to_not be_empty
  end
end
