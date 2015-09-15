require 'spec_helper'
require 'method_source'
require 'collatz/tco'
require 'collatz/sequence'

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
