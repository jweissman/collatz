require 'graph'

module Collatz
  module Helpers
    def hailstone(n)
      @hailstones ||= {}
      @hailstones[n] ||= Sequence.new.compute(n) 
    end

    def collatz_graph(depth=1)
      Graph.new.compute(depth)
    end

    def narrate(n)
      hailstone(n).each do |element|
        text = element.to_s 
        prime = element.prime?

        label = prime ? text.white : (element.odd? ? text.yellow : text.blue)
        print label

        description = prime ? '*'.white : element.prime_division.to_s.green
        print description
      end

      print '*'
    end

    def visualize(n=10, ext='png')
      digraph do
        collatz_graph(n).each do |k,vs|
          vs.each do |v|
            edge k, v
          end
        end

        save "collatz-#{n}", ext
      end

      true
    end
  end
end
