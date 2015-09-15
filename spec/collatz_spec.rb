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
          next_step = Collatz::Sequence.compute_next_step(2)
          expect(next_step).to eql(1)
        end
      end

      context "for odd numbers" do
        it 'multiples by three and adds one' do
          next_step = Collatz::Sequence.compute_next_step(3)
          expect(next_step).to eql(10)
        end
      end
    end 
  end

  context ".compute(n)" do
    context "generates the hailstone sequence" do
      describe "for 3" do
        let(:sequence) { [3, 10, 5, 16, 8, 4, 2, 1] }
        subject { Collatz::Sequence.compute(3) }
        it { is_expected.to eql sequence }
      end

      describe "for 4" do
        subject { Collatz::Sequence.compute(4) }
        it { is_expected.to eql([4,2,1]) }
      end
    end
  end
end
