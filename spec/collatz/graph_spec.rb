require 'spec_helper'
require 'collatz/graph'

describe Collatz::Graph do
  context ".compute_last_steps" do
    describe 'gives 3 and 20 for 10' do
      subject { Collatz::Graph.new.compute_last_steps(10) }
      it { is_expected.to eql([3, 20]) }
    end

    describe 'gives 4 for 2' do
      subject { Collatz::Graph.new.compute_last_steps(2) }
      it { is_expected.to eql([4]) }
    end
  end

  context ".compute" do
    describe "gives a hash of collatz graph edges" do
      subject { Collatz::Graph.new.compute }
      it 'should have expected entries' do
        expect(subject[1]).to  eql([2])
        expect(subject[2]).to  eql([4])
        expect(subject[3]).to  eql([6])
        expect(subject[6]).to  eql([12])
        expect(subject[10]).to eql([3, 20])
      end
    end
  end
end
