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

    def prime_color; :green end
    def odd_color;   :blue  end
    def even_color;  :white end

    def narrate(n)
      hailstone(n).each do |element|
        prime = element.prime?
        label = label_for element 
        print label + " "

        description = prime ? '*'.send(prime_color) : element.prime_division.to_s.green
        print description
        print "\n"
      end

      print '*'
    end

    def visualize(n=10, ext='png', write=true)
      digraph do
        collatz_graph(n).each do |k,vs|
          vs.each do |v|
            edge k, v
            node_for(v)
          end
        end

        if write
          puts 'writing graph data and generating image, please stand by'
          save "collatz-#{n}", ext
          puts 'complete!'
        end
      end

      true
    end

    protected

    def node_for(v)
      if v.prime?
        send(prime_color) << node(v)
      elsif v.odd?
        send(odd_color)   << node(v) 
      else
        send(even_color)  << node(v) 
      end
    end

    def label_for(n)
      text  = n.to_s 
      prime = n.prime?
      odd   = n.odd?

      if prime 
        text.send(prime_color) 
      elsif odd 
        text.send(odd_color) 
      else
        text.send(even_color)
      end
    end
  end
end
