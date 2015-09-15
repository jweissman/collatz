require 'spec_helper'

require 'collatz'
require 'collatz/helpers'
include Collatz::Helpers

describe Collatz do
  it "should have a VERSION constant" do
    expect(subject.const_get('VERSION')).to_not be_empty
  end

  it "should run the example from the README" do
    expect {
      hailstone 1024
      hailstone 513
      narrate 4
      narrate 51 
      collatz_graph 10
      collatz_graph 12
      visualize 5
    }.not_to raise_error
  end

  # it should have appropriate colors (graphs and narration)...
end
