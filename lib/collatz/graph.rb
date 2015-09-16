module Collatz
  class Graph
    def compute_last_steps(n)
      return [n * 2] unless (n-1) % 3 == 0 && ((n-1)/3).odd?
      [ n * 2, (n - 1)/3 ].reject(&:zero?).sort
    end

    def tree
      @tree ||= Hash.new do |h,k| 
        h[k] = compute_last_steps(k.to_i)
      end
    end

    def compute(depth=1,trace=true)
      tree[1]

      depth.times do |i|
        tree.values.each do |vs| 
          vs.each do |v| 
            tree[v] 
            print '.' if trace
          end
          print ',' if trace
        end
        print '*' if trace
      end

      tree
    end
  end
end
