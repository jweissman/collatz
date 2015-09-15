require 'spec_helper'
require 'collatz'

describe Collatz do
  it "should have a VERSION constant" do
    expect(subject.const_get('VERSION')).to_not be_empty
  end
end

describe Collatz::Sequence do
  context ".compute_next_step(n)" do
    describe "produces next element of hailstone sequence" do
      context "for even numbers" do
        it 'divides by two' do
          next_step = subject.compute_next_step(2)
          expect(next_step).to eql(1)
        end
      end

      context "for odd numbers" do
        it 'multiples by three and adds one' do
          next_step = subject.compute_next_step(3)
          expect(next_step).to eql(10)
        end
      end
    end 
  end

  context ".compute(n)" do
    context "generates the hailstone sequence" do
      describe "for 3" do
        let(:sequence) { [3, 10, 5, 16, 8, 4, 2, 1] }
        subject { Collatz::Sequence.new.compute(3) }
        it { is_expected.to eql sequence }
      end

      describe "for 4" do
        subject { Collatz::Sequence.new.compute(4) }
        it { is_expected.to eql([4,2,1]) }
      end

      describe "for very large n" do
        subject { proc { Collatz::Sequence.new.compute(1 + 2 ** 32) } }
        it { is_expected.not_to raise_error }
      end
    end
  end
end

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
        expect(subject[1]).to eql([2])
        expect(subject[2]).to eql([4])
        expect(subject[3]).to eql([6])
        expect(subject[6]).to eql([12])
        expect(subject[10]).to eql([3, 20])
      end
    end
  end
end
