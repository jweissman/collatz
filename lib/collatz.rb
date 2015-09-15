require 'collatz/version'

require 'prime'
require 'colorize'
require 'method_source'
require 'pry'
require 'graph'

module TailCallOptimization
  RubyVM::InstructionSequence.compile_option = {
    tailcall_optimization: true,
    trace_instruction: false
  }

  def recompile_with_tail(meth)
    meth = %{
      class #{self.to_s}
        #{meth}
      end
    }

    RubyVM::InstructionSequence.new(meth).eval
  end

  def xtail(meth)
    m = self.instance_method(meth)
    self.send :undef_method, meth
    recompile_with_tail(m.source)
  end
end

module Collatz
  class Sequence
    extend TailCallOptimization

    def compute_next_step(n)
      return n / 2 if n % 2 == 0
      (3 * n) + 1
    end

    def compute(starting_value)
      unless starting_value.is_a?(Integer) && starting_value > 0
        raise "only defined for positive integers" 
      end
      
      return [1] if starting_value == 1
      next_value = compute_next_step starting_value
      [starting_value] + compute(next_value)
    end

    # tail call optimize 
    xtail(:compute)
  end

  def collatz_sequence(n)
    @collatz_sequences ||= {}
    @collatz_sequences[n] ||= Collatz::Sequence.new.compute(n) 
  end

  class Graph
    def compute_last_steps(n)
      return [n * 2] unless (n-1) % 3 == 0 && ((n-1)/3).odd?
      [ n * 2, (n - 1)/3 ].reject(&:zero?).sort
    end

    def compute(depth=1)
      @graph ||= Hash.new do |h,k| 
        h[k] = compute_last_steps(k.to_i)
      end

      @graph[1]

      depth.times do |i|
        @graph.values.each do |vs| 
          vs.each do |v| 
            @graph[v] 
          end
        end
        print '.' if i%3 == 0
      end
      @graph
    end
  end

  def collatz_graph(depth=1)
    Collatz::Graph.new.compute(depth)
  end

  def narrate(n)
    collatz(n).each do |i|
      print "\n  #{i.odd? ? i.to_s.yellow : i.to_s.blue} "
      print i.prime? ? '*'.white : i.prime_division.to_s.green
    end
    print '.'
  end

  def visualize(n=10,ext='png')
    digraph do
      collatz_graph(n).each do |k,vs|
        vs.each do |v|
          edge k, v
        end
      end

      save "collatz-#{n}", ext
    end
  end
end
